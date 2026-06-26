{ self, ... }: {
  imports = with self.nixosModules; [
    # Pick the modules you need for this machine
    audio
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
    user
    # Skip bluetooth, wireless, etc. if not needed
  ];

  networking.hostName = "Desktop";

  system.stateVersion = "25.11";
}
