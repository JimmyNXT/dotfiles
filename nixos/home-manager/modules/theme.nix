{ pkgs, config,... }:{
    stylix.enable = config.stylix.enable;
    stylix.base16Scheme = config.stylix.base16Scheme;
    stylix.image = config.stylix.image;
    stylix.polarity = config.stylix.polarity;
    stylix.targets.gtk.enable = config.stylix.targets.gtk.enable;
    targets.grub.enable = false;
    targets.plymouth.enable = false;
}