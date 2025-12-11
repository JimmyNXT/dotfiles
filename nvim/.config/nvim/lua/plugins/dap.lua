return {
    'mfussenegger/nvim-dap',
    dependencies = {},
    keys = {
        -- Basic debugging keymaps, feel free to change to your liking!
        {
            '<F5>',
            function()
                require('dap').continue()
            end,
            desc = 'Debug: Start/Continue',
        },
        {
            '<F1>',
            function()
                require('dap').step_into()
            end,
            desc = 'Debug: Step Into',
        },
        {
            '<F2>',
            function()
                require('dap').step_over()
            end,
            desc = 'Debug: Step Over',
        },
        {
            '<F3>',
            function()
                require('dap').step_out()
            end,
            desc = 'Debug: Step Out',
        },
        {
            '<leader>b',
            function()
                require('dap').toggle_breakpoint()
            end,
            desc = 'Debug: Toggle Breakpoint',
        },
        {
            '<leader>B',
            function()
                require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end,
            desc = 'Debug: Set Breakpoint',
        },
        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    },
    config = function()
        local dap = require 'dap'

        function split_respecting_quotes(str)
            local result = {}
            local in_quotes = false
            local current = ''

            for i = 1, #str do
                local char = str:sub(i, i)

                if char == '"' then
                    in_quotes = not in_quotes
                elseif char == ' ' and not in_quotes then
                    if current ~= '' then
                        table.insert(result, current)
                        current = ''
                    end
                else
                    current = current .. char
                end
            end

            if current ~= '' then
                table.insert(result, current)
            end

            return result
        end

        -- dap.adapters.gdb = {
        --     type = 'executable',
        --     command = 'gdb',
        --     args = { '--interpreter=dap', '--eval-command', 'set print pretty on' },
        --     name = 'gdb'
        -- }

        dap.adapters.lldb = {
            type = 'executable',
            command = 'lldb-dap', -- remember to sim link lldb-dap-[someting] or lldb-vscode[something] to lldb-dap
            name = 'lldb',
        }

        dap.configurations.cpp = {
            {
                name = '(LLDB) Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
            },
            {
                name = '(LLDB) Launch with args',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = function()
                    return split_respecting_quotes(vim.fn.input('Args: ', ''))
                end,
            },
            -- {
            --     name = 'Launch (GDB)',
            --     type = 'gdb',
            --     request = 'launch',
            --     program = function()
            --         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            --     end,
            --     args = {}, -- provide arguments if needed
            --     cwd = '${workspaceFolder}',
            --     stopAtBeginningOfMainSubprogram = false,
            -- },
            -- {
            --     name = 'Select and attach to process (GDB)',
            --     type = 'gdb',
            --     request = 'attach',
            --     program = function()
            --         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            --     end,
            --     pid = function()
            --         local name = vim.fn.input 'Executable name (filter): '
            --         return require('dap.utils').pick_process { filter = name }
            --     end,
            --     cwd = '${workspaceFolder}',
            -- },
            -- {
            --     name = 'Attach to gdbserver :1234',
            --     type = 'gdb',
            --     request = 'attach',
            --     target = 'localhost:1234',
            --     program = function()
            --         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            --     end,
            --     cwd = '${workspaceFolder}',
            -- },
        }
        dap.configurations.c = dap.configurations.cpp
    end,
}
