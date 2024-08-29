return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      filters = { dotfiles = false },
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        width = 27,
        preserve_window_proportions = true,
        adaptive_size = true,
      },
      renderer = {
        root_folder_label = false,
        highlight_git = true,
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            default = "󰈚 ",
            folder = {
              default = " ",
              empty = " ",
              empty_open = " ",
              open = " ",
              symlink = " ",
            },
            git = { unmerged = " " },
          },
        },
      },
    }
    -- Mappings
    local api = require "nvim-tree.api"
    vim.keymap.set("n", "<C-n>", api.tree.toggle, { desc = "Toggle Nvim Tree" })
    vim.keymap.set("n", "<leader>th", api.tree.toggle_help, { desc = "Open Nvim Tree Help" })
  end,
}
