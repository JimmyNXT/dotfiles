return {
    'hedyhli/outline.nvim',
    lazy = true,
    keys = {
        { '<leader>to', '<cmd>Outline<CR>', desc = 'Toggle Symbols Outline', mode = 'n' },
    },
    cmd = { 'Outline', 'OutlineOpen' },

    opts = function()
        return require 'configs.outline'
    end,
    config = function(_, opts)
        require('outline').setup(opts)
    end,
}
