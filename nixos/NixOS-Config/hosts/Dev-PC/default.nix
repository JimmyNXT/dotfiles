{ self, ... }: {
  imports = with self.nixosModules; [
    audio
    boot
    claude
    development
    docker
    drawio
    font
    i3
    llm-host
    locale
    mime
    neovim
    network
    nix
    obsidian
    office
    okular
    pi-dev
    teams
    terminal
    timezone
    udisk2
    user
    virt-manager
  ];

  networking.hostName = "Dev-PC";

  # Trust the Fortinet CA certificate
  security.pki.certificateFiles = [
    ./FG101FTK23009213.crt
  ];

  # Bridge for VMs — slaves enp3s0 into br0 so VMs are on the LAN
  networking.bridges.br0.interfaces = [ "enp3s0" ];
  networking.interfaces.br0 = {
    useDHCP = true;

    ipv4.routes = [
      {
        address = "172.0.0.0";
        prefixLength = 8;
        via = "10.37.12.102";
      }
    ];
  };

  # Don't let NetworkManager manage the enslaved physical interface
  networking.networkmanager.unmanaged = [
    "enp3s0"
    "enp0s20f0u7u3c2"
  ];

  # If you have a static IP, use this instead of useDHCP:
  # networking.interfaces.br0.ipv4.addresses = [{
  #   address = "192.168.1.100";
  #   prefixLength = 24;
  # }];
  # networking.defaultGateway = "192.168.1.1";

  networking.nameservers = [
    "172.25.40.101"
    "10.37.12.5"
    "1.1.1.1"
    "8.8.8.8"
  ];
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
