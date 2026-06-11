{ ... }: {
  flake.nixosModules.neovim = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      neovim
      vimPlugins.nvim-treesitter.withAllGrammars

      ripgrep

      bash-language-server
      clang-tools
      codespell
      lua-language-server
      marksman
      nil
      nixpkgs-fmt
      perlnavigator
      prettier
      python3Packages.black
      rust-analyzer
      rustfmt
      stylua
    ];
  };
}
