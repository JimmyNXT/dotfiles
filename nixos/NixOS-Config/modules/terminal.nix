{ ... }: {
  flake.nixosModules.terminal = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
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
      gh

      xclip
      zip

      libnotify
      nix-prefetch-scripts

      htop

      ghostty # should be removed once on i3
    ];

    programs.zsh = {
      enable = true;
      # Let oh-my-zsh handle compinit (otherwise it's called twice)
      enableCompletion = false;
      enableGlobalCompInit = false;
      enableLsColors = true;

      shellAliases = {
        update-nix = "sudo nixos-rebuild switch";
        upgrade-nix = "sudo nix-channel --update && sudo nixos-rebuild switch";
        clean-nix = "sudo nix-collect-garbage -d";
        ls = "ls -Fp --color=auto";
        la = "ls -Fp --color=auto -al";
        tmux = "tmux -u";
        calc = "bc <<<";
      };

      ohMyZsh = {
        enable = true;
        theme = "jispwoso";
        plugins = [
          "git"
          "sudo"
          "colored-man-pages"
          "virtualenv"
          "python"
        ];
        # Disable update checks (won't work in Nix store)
        preLoaded = ''
          zstyle ':omz:update' mode disabled
          DISABLE_AUTO_UPDATE="true"
        '';
      };

      interactiveShellInit = ''
        NIX_SHELL_PRESERVE_PROMPT=0
        source ${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh

        function add_nix_shell_indicator() {
          if [[ -z "$_ORIGINAL_PROMPT" ]]; then
              _ORIGINAL_PROMPT="$PROMPT"
          fi

          local prompt_prefix=""

          if [[ -n "$IN_NIX_SHELL" ]]; then
              prompt_prefix+="%F{cyan}[nix]%f "
          fi

          if [[ -n "$VIRTUAL_ENV" ]]; then
              prompt_prefix+="%F{yellow}(venv)%f "
          fi

          if [[ -n "$prompt_prefix" ]]; then
              PROMPT="$prompt_prefix$_ORIGINAL_PROMPT"
          else
              PROMPT="$_ORIGINAL_PROMPT"
          fi
        }

        precmd_functions+=(add_nix_shell_indicator)

        # Force zsh in nix develop (ignores stdenv's SHELL override)
        nix() {
          if [[ "$1" == "develop" ]]; then
            shift
            command nix develop "$@" --command zsh
          else
            command nix "$@"
          fi
        }

        if [[ -f ~/.zsh_private ]]; then
          source ~/.zsh_private
        fi
      '';
    };

    environment = {
      sessionVariables = {
        EDITOR = "vim";
      };
    };
  };
}
