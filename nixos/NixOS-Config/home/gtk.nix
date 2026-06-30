{ pkgs, ... }:
{
  # Dark theme for GTK3 and GTK4
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.adwaita-dark-icon-theme;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Capitaine_cursors";
      package = pkgs.capitaine-cursors;
      size = 24;
    };

    # GTK3 settings
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-cursor-theme-size = 24;
      gtk-font-name = "Source Code Pro 10";
      gtk-icon-theme-name = "Adwaita";
    };

    # GTK4 settings
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-cursor-theme-size = 24;
      gtk-font-name = "Noto Sans 10";
      gtk-icon-theme-name = "Adwaita";
    };
  };
}
