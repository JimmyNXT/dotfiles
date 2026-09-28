{ ... }: {
  flake.nixosModules.nix = {
    nix = {
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 14d";
      };
    };
    boot.loader.systemd-boot.configurationLimit = 10;
  };
}
