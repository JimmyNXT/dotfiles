return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  version = "^1.0.0", -- optional: only update when a new 1.x version is released
  config = function()
    vim.g.barbar_auto_setup = true

    require("barbar").setup {
      animation = false,
      auto_hide = false,
      tabpages = false,
      clickable = true,
      focus_on_close = "left",
      hide = { extensions = true, inactive = false },
      highlight_alternate = false,
      highlight_inactive_file_icons = false,
      highlight_visible = true,
      icons = {
        buffer_index = false,
        buffer_number = false,
        button = "",
        filetype = {
          custom_colors = false,
          enabled = true,
        },
        separator = { left = "▎", right = "" },
        separator_at_end = true,
        modified = { button = "●" },
        pinned = { button = "", filename = true },
        preset = "default",
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = true },
        inactive = { button = "×" },
        visible = { modified = { buffer_number = false } },
      },
      insert_at_end = true,
      insert_at_start = false,
      maximum_padding = 1,
      minimum_padding = 1,
      maximum_length = 30,
      minimum_length = 0,
      semantic_letters = true,
      sidebar_filetypes = {
        NvimTree = true,
        -- ["nvimtree"] = { event = "BufWipeout" },
        Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
      },
      letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
      no_name_title = "No Name",
      sort = {
        ignore_case = true,
      },
    }
    vim.keymap.set("n", "<leader>x", "<Cmd>BufferClose<CR>", { desc = "Close Buffer" })
    vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Close Next" })
  end,
}
