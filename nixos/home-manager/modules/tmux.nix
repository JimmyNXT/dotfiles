{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
      plugins = with pkgs; [
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.catppuccin
        tmuxPlugins.yank
    ];
  };
  home.file = {
    ".tmux.conf" = {
      source = ../../../tmux/.tmux.conf;
    };
  };
}
