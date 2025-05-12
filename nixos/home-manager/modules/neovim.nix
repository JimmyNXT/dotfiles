{ pkgs, ... }: {
  programs.neovim = {
    enable = true;

    vimAlias = true;
    viAlias = true;

    withPython3 = true;

    extraPackages = with pkgs; [
      lua-language-server
      stylua
      typescript-language-server
      vscode-extensions.esbenp.prettier-vscode
      nixpkgs-fmt
      prettierd
      shfmt
      eslint_d
      libgcc
      pyright
      golines
      perlnavigator
      python311Packages.black
      marksman
      python311Packages.python-lsp-server
      nil
      # vimPlugins.nvim-treesitter-parsers.hyprlang
      lua51Packages.luarocks-nix
      python311Packages.pynvim
    ];
  };

  home.file = {
    ".config/nvim" = {
      source = ../../../nvim/.config/nvim;
      recursive = true;
    };
  };
}
