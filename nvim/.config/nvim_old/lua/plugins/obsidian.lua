return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = function()
    return require "configs.obsidian"
  end,
  config = function(_, opts)
    vim.o.conceallevel = 1
    require("obsidian").setup(opts)
  end,
}
