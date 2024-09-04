return {
  "sQVe/sort.nvim",
  lazy = false,
  opts = function()
    return require "configs.sort"
  end,
  config = function(_, opts)
    require("sort").setup { opts }
  end,
}
