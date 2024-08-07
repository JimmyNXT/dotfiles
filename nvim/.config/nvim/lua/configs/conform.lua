local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    python = { "black" },
    sh = { "shfmt" },
    cpp = { "clang-format" },
    c = { "clang-format" },
    -- nix = {"nixpkgs-fmt"},
  },
  -- format_on_save = {
  --   timeout = 500,
  --   lsp_fallback = false,
  -- },
}

require("conform").setup(options)
