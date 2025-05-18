{
  description = "My system configuration";

  inputs = {

    nixpkgs ={
      url = "github:nixos/nixpkgs/nixos-24.11";
    };

    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, stylix, ... }@inputs: let
    system = "x86_64-linux";
    homeStateVersion = "24.11";
    user = "jimmynxt";
    hosts = [
      { hostname = "vm"; stateVersion = "24.11"; }
      { hostname = "HP-Laptop"; stateVersion = "24.11"; }
    ];

    makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs stateVersion hostname user;
      };

      modules = [
        inputs.stylix.nixosModules.stylix
        ./hosts/${hostname}/configuration.nix
        ./local-packages.nix
      ];
    };

  in {
    nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostname}" = makeSystem {
          inherit (host) hostname stateVersion;
        };
      }) {} hosts;

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit inputs homeStateVersion user;
        pkgs-unstable = import nixpkgs-unstable { system = "${system}"; };
      };

      modules = [
        # inputs.stylix.nixosModules.stylix
        ./home-manager/home.nix
      ];
    };
  };
}
