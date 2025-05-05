{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    arandr
    blueman
    firefox
    kdePackages.okular
    libsForQt5.spectacle
    mendeley
    obsidian
    pavucontrol
    teams-for-linux
    usbimager
    ventoy-full

    # CLI utils
    bc            # Calculator
    brightnessctl # Brightness control
    curl
    feh
    fzf
    gdb
    gf
    git
    linuxHeaders
    ntfs3g
    oh-my-zsh
    openocd
    platformio-core
    pulseaudio
    ripgrep
    stow
    unzip
    virt-manager
    wget
    xca
    xclip
    zip
    zsh

    #fonts
    font-awesome
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })

    # Coding stuff
    openjdk23
    nodejs
    python311

    # # WM stuff
    # libsForQt5.xwaylandvideobridge
    libnotify
    # xdg-desktop-portal-gtk
    # xdg-desktop-portal-hyprland

    # # Other
    # bemoji
    # nix-prefetch-scripts
  ];
}
