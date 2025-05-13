{ pkgs, ... }:{
    stylix.enable = true;
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    stylix.image = ../../../i3/.config/i3/desktop.jpg;
}