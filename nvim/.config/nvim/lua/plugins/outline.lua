return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },

  opts = function()
    return require "configs.outline"
  end,
  config = function(_, opts)
    require("outline").setup(opts)
  end,
}
