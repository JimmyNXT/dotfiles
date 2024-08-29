return {
  "williamboman/mason.nvim",
  config = function()
    -- dofile(vim.g.base46_cache .. "mason")
    require("mason").setup {

      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- Vim stuff
        "vim-language-server",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",

        "prettier",

        -- c/cpp stuff
        -- "clangd",
        "clang-format",
        "eslint-lsp",
        "pyright",
        "black",

        -- Markdown
        "marksman",

        -- Nix
        -- "rnix-lsp",
        -- "nixpkgs-fmt",

        -- Java
        -- "jdtls",
      },
    }
  end,
}
