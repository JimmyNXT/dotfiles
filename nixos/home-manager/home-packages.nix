{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    nemo
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
    # git-graph
    # grimblast
    # htop
    # hyprpicker
    ntfs3g
    # mediainfo
    # playerctl
    ripgrep
    # udisks
    unzip
    wget
    curl
    # wtype
    zip
    virt-manager
    stow

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
