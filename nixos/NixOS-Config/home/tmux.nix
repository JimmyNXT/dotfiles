{ ... }: {
  home.file.".tmux.conf" = {
    source = ../../../tmux/.tmux.conf;
    force = true;
  };

  home.file.".config/tmuxinator/keystone.yml" = {
    source = ../../../tmuxinator/.config/tmuxinator/keystone.yml;
    force = true;
  };
}
