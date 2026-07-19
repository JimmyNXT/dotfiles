{ ... }: {
  flake.nixosModules.obsidian = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      obsidian
    ];
  };
}
