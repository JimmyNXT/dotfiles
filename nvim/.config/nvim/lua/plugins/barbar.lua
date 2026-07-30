return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = {
        sidebar_filetypes = {
            ['neo-tree'] = true, -- { event = 'BufWipeout' },
        },
        maximum_length = 30,
        clickable = true,
        drag_to_reorder = false,
    },
    config = function(_, opts)
        require('barbar').setup(opts)
        vim.keymap.set('n', '<Tab>', '<cmd>BufferNext<CR>', { desc = 'Move to next buffer' })
        vim.keymap.set('n', '<leader>x', '<cmd>BufferClose<CR>', { desc = 'Close current buffer' })
    end,
}
