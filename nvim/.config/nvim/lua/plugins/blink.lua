return { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            version = '2.*',
            build = (function()
                if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                    return
                end
                return 'make install_jsregexp'
            end)(),
            dependencies = {},
            opts = {},
        },
        'folke/lazydev.nvim',
    },
    opts = {
        keymap = {
            preset = 'default',
            ['<CR>'] = {
                function(cmp)
                    if cmp.is_menu_visible() then
                        cmp.select_and_accept()
                        return true
                    end
                end,
                'fallback',
            },
            -- ['<Right>'] = { 'select_and_accept', 'fallback' },
            ['<Tab>'] = { 'select_and_accept', 'fallback' },
        },

        appearance = {
            nerd_font_variant = 'mono',
        },

        completion = {
            list = {
                selection = {
                    preselect = true,
                    --  auto_insert = true
                },
            },
            documentation = {
                auto_show = false,
                -- auto_show_delay_ms = 500,
                window = { border = 'single' },
            },
            menu = {
                auto_show = false,
                border = 'single',
                draw = { columns = { { 'kind_icon', 'label', 'label_description', gap = 1 }, { 'kind' } } },
            },
            ghost_text = {
                enabled = true,
                show_with_menu = false,
            },
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer' },
            providers = {
                lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
            },
        },
        snippets = { preset = 'luasnip' },
        fuzzy = { implementation = 'lua' },
        signature = { enabled = true, window = { border = 'single' } },
    },
}
