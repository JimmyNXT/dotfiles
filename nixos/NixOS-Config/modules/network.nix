{ ... }: {
  flake.nixosModules.network = {
    networking.networkmanager.enable = true;
    networking.firewall.enable = true;
    # networking.wireless.enable = true;

    services.twingate.enable = true;
  };
}
