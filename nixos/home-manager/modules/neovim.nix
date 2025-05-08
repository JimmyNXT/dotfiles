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
      # prettierd
      eslint_d
      llvmPackages_19.clang-tools
      pyright
      perlnavigator
      marksman
      # python311Packages.python-lsp-server
      nixd
      # vimPlugins.nvim-treesitter-parsers.hyprlang
      lua51Packages.luarocks-nix
    ];
  };

  home.file = {
    ".config/nvim" = {
      source = ../../../nvim/.config/nvim;
      recursive = true;
    };
  };
}
