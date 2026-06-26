{ ... }: {
  # Symlink nvim config directory from dotfiles repo
  # home-manager recursively symlinks each file inside
  home.file.".config/nvim" = {
    source = ../../../nvim/.config/nvim;
    force = true;
  };
}
