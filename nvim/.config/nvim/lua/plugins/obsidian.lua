return {
  -- 'epwalsh/obsidian.nvim',
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  ft = 'markdown',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'saghen/blink.cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/vaults/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/vaults/**.md',
  },
  -- @module 'obsidian'
  -- @type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = 'personal',
        path = '~/vaults/personal',
      },
      {
        name = 'work',
        path = '~/vaults/professional',
      },
    },
  },
  config = function(_, opts)
    vim.o.conceallevel = 1
    require('obsidian').setup(opts)
  end,
}
