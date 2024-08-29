return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signs = {
          delete = { text = "󰍵" },
          changedelete = { text = "󱕖" },
        },
        on_attach = function(_)
          local gs = package.loaded.gitsigns

          vim.keymap.set("n", "<leader>rh", gs.reset_hunk, { desc = "Reset Hunk" })
          vim.keymap.set("n", "<leader>ph", gs.preview_hunk, { desc = "Preview Hunk" })
          vim.keymap.set("n", "<leader>gb", gs.blame_line, { desc = "Blame Line" })
        end,
      }
    end,
  },
}
