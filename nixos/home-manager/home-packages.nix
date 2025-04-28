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
    xclip
    fzf
    xca
    git
    ntfs3g
    ripgrep
    # neovim
    tmux
    virt-manager
    oh-my-zsh
    vscode
    unzip
    wget
    curl
    zip
    virt-manager
    stow
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
