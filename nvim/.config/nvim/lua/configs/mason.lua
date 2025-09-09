local options = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",

    "prettier",
    "eslint_d",

    -- c/cpp stuff
    -- "clangd",
    "clang-format",
    "eslint-lsp",
    "pyright",
    "black",

    -- Markdown
    "marksman",

    -- Java
    -- "jdtls",

    -- Perl
    "perlnavigator",

    -- GO
    "gopls",
    "golines",
    "gospel",

    --Spelling
    "codespell",

    -- Make
    "checkmake",
  },
}

return options
