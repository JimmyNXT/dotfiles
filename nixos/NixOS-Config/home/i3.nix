{ ... }: {
  # Symlink i3 config from dotfiles repo
  home.file.".config/i3" = {
    source = ../../../i3/.config/i3;
    force = true;
  };

  # Symlink rofi config (lives alongside i3 in the dotfiles)
  home.file.".config/rofi" = {
    source = ../../../i3/.config/rofi;
    force = true;
  };

}
