{ ... }: {
  home.file.".zshrc" = {
    text = ''
      # Minimal .zshrc — global zsh config is handled by NixOS
      source /etc/zshrc
    '';
    force = true;
  };
}
