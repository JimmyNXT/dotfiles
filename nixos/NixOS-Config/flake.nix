{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } ({ config, self, ... }: {
      systems = [ "x86_64-linux" ];

      imports = [
        (inputs.import-tree ./modules)
      ];

      flake.nixosConfigurations.HP-Laptop = let
        inherit (inputs) nixpkgs nixpkgs-unstable;
        system = "x86_64-linux";
      in nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit self inputs;
          unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./configuration.nix
          ./hosts/HP-Laptop/hardware-configuration.nix
          ./hosts/HP-Laptop/default.nix
        ];
      };
    });
}
