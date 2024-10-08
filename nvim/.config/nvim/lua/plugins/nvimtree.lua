return {
  "nvim-tree/nvim-tree.lua",
  opts = function()
    return {
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },

      view = {
        width = 27,
        preserve_window_proportions = true,
        adaptive_size = true,
      },
    }
  end,
}
