{ ... }: {
  flake.nixosModules.teams = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      teams-for-linux
    ];
  };
}
