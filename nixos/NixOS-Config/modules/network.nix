{ ... }: {
  flake.nixosModules.network = {
    networking.networkmanager.enable = true;
    networking.firewall.enable = true;
    # networking.wireless.enable = true;

    # services.twingate.enable = true;

    boot.kernel.sysctl."net.bridge.bridge-nf-call-iptables" = 0;
  };
}
