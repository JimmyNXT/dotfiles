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
    platformio
    avrdude
    pulseaudio
    ripgrep
    stow
    unzip
    virt-manager
    wget
    xca
    xclip
    zip

    #fonts
    font-awesome
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })

    # Coding stuff
    openjdk23
    nodejs
    python311
    python311Packages.pip
    go
    rustc
    cargo

    # # WM stuff
    libnotify
    # xdg-desktop-portal-gtk

    # # Other
    nix-prefetch-scripts
  ];
}
