{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } ({ config, self, ... }:
      let
        inherit (inputs) nixpkgs nixpkgs-unstable;
        system = "x86_64-linux";

        # Helper to create a host configuration
        mkHost = hostName: hostModules: nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit self inputs;
            unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.jimmynxt = import ./home/default.nix;
              };
            }
            ./configuration.nix
            ./hosts/${hostName}/hardware-configuration.nix
            ./hosts/${hostName}/default.nix
          ] ++ hostModules;
        };
      in {
        systems = [ "x86_64-linux" ];

        imports = [
          (inputs.import-tree ./modules)
        ];

        flake.nixosConfigurations = {
          HP-Laptop = mkHost "HP-Laptop" [ ];

          # Add new hosts here — just create a hosts/<name>/ directory
          # Desktop = mkHost "Desktop" [ ];
          # Server  = mkHost "Server"  [ ];
        };
      });
}
