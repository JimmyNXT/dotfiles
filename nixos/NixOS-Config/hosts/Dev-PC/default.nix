{ self, ... }: {
  imports = with self.nixosModules; [
    audio
    bluetooth
    boot
    development
    docker
    drawio
    font
    i3
    locale
    mime
    neovim
    network
    nix
    office
    okular
    terminal
    timezone
    udisk2
    user
    virt-manager
    wireless
  ];

  networking.hostName = "Dev-PC";

  # Trust the Fortinet CA certificate
  security.pki.certificateFiles = [
    ./FG101FTK23009213.crt
  ];

  # Bridge for VMs — slaves enp3s0 into br0 so VMs are on the LAN
  networking.bridges.br0.interfaces = [ "enp3s0" ];
  networking.interfaces.br0.useDHCP = true;

  # Don't let NetworkManager manage the enslaved physical interface
  networking.networkmanager.unmanaged = [ "enp3s0" ];

  # If you have a static IP, use this instead of useDHCP:
  # networking.interfaces.br0.ipv4.addresses = [{
  #   address = "192.168.1.100";
  #   prefixLength = 24;
  # }];
  # networking.defaultGateway = "192.168.1.1";
  # networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
