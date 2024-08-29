return {
  "stevearc/conform.nvim",
  -- event = 'BufWritePre', -- uncomment for format on save
  config = function()
    require("conform").setup {
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

    vim.keymap.set("n", "<leader>fm", function()
      require("conform").format { lsp_fallback = true }
    end, { desc = "Format file" })
  end,
}
