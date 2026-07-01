{ ... }: {
  home.file.".config/ghostty/config" = {
    text = ''
      # Disable client-side decorations (title bar with dash, square, x)
      window-decoration = false
      gtk-titlebar = false
      window-show-tab-bar = always

      # Use xterm-256color so remote hosts without ghostty terminfo work correctly
      term = xterm-256color
    '';
  };
}
