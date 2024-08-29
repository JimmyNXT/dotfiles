return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    config = function()
      local config = require "nvim-treesitter.configs"
      config.setup {
        ensure_installed = {
          "vim",
          "vimdoc",
          "lua",
          "luadoc",
          "printf",
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "c",
          "markdown",
          "markdown_inline",
        },
        auto_install = true,
        indent = {
          enable = true,
          -- disable = {
          --   "python"
          -- },
        },
        highlight = {
          enable = true,
          use_languagetree = true,
        },
      }
    end,
  },
}
