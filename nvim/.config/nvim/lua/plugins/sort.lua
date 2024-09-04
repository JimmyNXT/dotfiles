return {
  "sQVe/sort.nvim",
  lazy = false,
  opts = function()
    return {}
  end,
  config = function(_, opts)
    require("sort").setup { opts }
  end,
}
