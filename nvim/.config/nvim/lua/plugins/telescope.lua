return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },
      extensions_list = { "themes", "terms" },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "telescope find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "telescope help page" })
      vim.keymap.set("n", "<leader>fj", builtin.marks, { desc = "telescope find marks" })
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "telescope find oldfiles" })
      vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "telescope find in current buffer" })
      vim.keymap.set("n", "<leader>cm", builtin.git_commits, { desc = "telescope git commits" })
      vim.keymap.set("n", "<leader>gt", builtin.git_status, { desc = "telescope git status" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "telescope find files" })

      require("telescope").load_extension("ui-select")
    end,
  },
}
