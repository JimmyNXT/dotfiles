return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  config = function()
    return require "configs.lint"
  end,
}
