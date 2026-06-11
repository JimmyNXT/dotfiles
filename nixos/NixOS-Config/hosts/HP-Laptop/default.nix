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
    terminal
    timezone
    udisk2
    user
    virt-manager
  ];

  networking.hostName = "HP-Laptop";
}
