return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
    },
    keys = {
        {
            '<F7>',
            function()
                require('dapui').toggle()
            end,
            desc = 'Debug: See last session result.',
        },
    },
    opts = {
        layouts = {
            {
                elements = {
                    -- List the elements you want in this layout
                    { id = 'scopes', size = 0.50 },
                    { id = 'breakpoints', size = 0.25 },
                    { id = 'stacks', size = 0.25 },
                    -- { id = 'watches', size = 0.25 },
                },
                size = 50, -- total size of the layout
                position = 'left', -- position on the screen
            },
            {
                elements = {
                    { id = 'repl', size = 0.5 },
                    -- { id = 'console', size = 0.5 },
                },
                size = 20, -- height for bottom, width for left/right
                position = 'bottom',
            },
        },
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
            icons = {
                pause = '⏸',
                play = '▶',
                step_into = '⏎',
                step_over = '⏭',
                step_out = '⏮',
                step_back = 'b',
                run_last = '▶▶',
                terminate = '⏹',
                disconnect = '⏏',
            },
        },
    },
    config = function(_, opts)
        local dapui = require 'dapui'
        dapui.setup(opts)

        local function focus_code_window()
            -- Give time for windows to settle
            vim.defer_fn(function()
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local buf = vim.api.nvim_win_get_buf(win)
                    local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
                    local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')

                    -- Skip special windows
                    if buftype == '' and filetype ~= 'neo-tree' and filetype ~= 'NvimTree' and not filetype:match '^dap' then
                        vim.api.nvim_set_current_win(win)
                        return
                    end
                end
            end, 50) -- 50ms delay
        end

        local dap = require 'dap'
        dap.listeners.before.attach['dapui_config'] = function()
            dapui.open()
        end
        dap.listeners.before.launch['dapui_config'] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
            vim.cmd 'Neotree close'
            vim.cmd 'Neotree reveal'
            focus_code_window()
        end
        dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
            vim.cmd 'Neotree close'
            vim.cmd 'Neotree reveal'
            focus_code_window()
        end
    end,
}
