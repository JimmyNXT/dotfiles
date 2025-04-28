{ pkgs, ... }:{
    qt.enable = true;

    # platform theme "gtk" or "gnome"
    qt.platformTheme = "gtk2";

    # name of the qt theme
    qt.style = "adwaita-dark";


    # gtk.enable = true;

    # gtk.cursorTheme.package = pkgs.bibata-cursors;
    # gtk.cursorTheme.name = "Bibata-Modern-Ice";

    # gtk.theme.package = pkgs.adw-gtk3;
    # gtk.theme.name = "adw-gtk3";

    # gtk.iconTheme.package = gruvboxPlus;
    # gtk.iconTheme.name = "GruvboxPlus";

    # gtk.cursorTheme.package = pkgs.bibata-cursors;
    # gtk.cursorTheme.name = "Bibata-Modern-Ice";
}