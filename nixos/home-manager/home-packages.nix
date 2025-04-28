{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    arandr
    nemo
    firefox
    blueman
    obsidian
    pavucontrol
    teams-for-linux
    # telegram-desktop

    # CLI utils
    bc            # Calculator
    brightnessctl # Brightness control
    curl
    fzf
    git
    ntfs3g
    oh-my-zsh
    ripgrep
    stow
    unzip
    virt-manager
    vscode
    wget
    xca
    xclip
    zip
    zsh

    #fonts
    font-awesome
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })

    # Coding stuff
    # openjdk23
    # nodejs
    # python311

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
