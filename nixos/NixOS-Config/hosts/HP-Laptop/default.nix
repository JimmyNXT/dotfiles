{ self, ... }: {
  imports = with self.nixosModules; [
    audio
    bluetooth
    boot
    development
    docker
    font
    i3
    locale
    mime
    neovim
    network
    nix
    office
    okular
    pi-dev
    terminal
    timezone
    udisk2
    user
    virt-manager
    wireless
  ];

  networking.hostName = "HP-Laptop";
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
