local config = {

  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

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

return config
