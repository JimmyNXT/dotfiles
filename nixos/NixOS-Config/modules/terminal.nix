{ pkgs, ... }:
let
  unstable = import (fetchTarball "https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz") { };
in
{
  environment.systemPackages = with pkgs; [
    unstable.opencode
    tmux
    zsh-nix-shell

    bc
    brightnessctl
    curl
    feh
    fzf
    linuxHeaders
    ntfs3g
    stow
    unzip

    xclip
    zip

    libnotify
    nix-prefetch-scripts

    htop
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableLsColors = true;

    shellAliases = {
      update-nix = "sudo nixos-rebuild switch";
      upgrade-nix = "sudo nix-channel --update && sudo nixos-rebuild switch";
      clean-nix = "sudo nix-collect-garbage -d";
      ls = "ls -Fp --color=auto";
      la = "ls -Fp --color=auto -al";
      tmux = "tmux -u";
      calc = "f() { echo $1 | bc };f";
    };

    ohMyZsh = {
      enable = true;
      theme = "jispwoso";
      plugins = [
        "git"
        "sudo"
        "colored-man-pages"
        "virtualenv"
      ];
    };

    interactiveShellInit = ''
      NIX_SHELL_PRESERVE_PROMPT=0
      source ${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh

      function add_nix_shell_indicator() {
        if [[ -z "$_ORIGINAL_PROMPT" ]]; then
            _ORIGINAL_PROMPT="$PROMPT"
        fi
        
        if [[ -n "$IN_NIX_SHELL" ]]; then
            PROMPT="%F{cyan}[nix]%f $_ORIGINAL_PROMPT"
        else
            PROMPT="$_ORIGINAL_PROMPT"
        fi
      }

      precmd_functions+=(add_nix_shell_indicator)
    '';
  };

  environment = {
    shellInit = ''
      export PATH=$PATH:$HOME/bin
    '';

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "konsole";
    };
  };
}
