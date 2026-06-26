{ config, pkgs, ... }: {
  # Cursor theme only — no GTK theme/font/decoration settings
  home.pointerCursor = {
    name = "capitaine-cursors";
    package = pkgs.capitaine-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
