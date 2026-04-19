return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
        'mason-org/mason.nvim',
    },
    opts = function()
        local ensure_installed = {
            'html',
            'cssls',
            'eslint',
            'ts_ls',
            'pyright',
            'bashls',
            'perlnavigator',
            'prettier',
            'eslint_d',
        }

        -- LSP Servers that should only be installed on not FreeBSD
        if not vim.g.is_freeBSD and not vim.g.is_nixos then
            vim.list_extend(ensure_installed, {
                'clangd',
                'rust_analyzer',
                'marksman',
                -- 'nil_ls',
                'lua_ls',
                'stylua',

                -- c/cpp stuff
                'clang-format',

                -- Python stuff
                'black',

                -- Java
                -- "jdtls",

                -- GO
                -- 'gopls',
                -- 'golines',
                -- 'gospel',

                -- Spelling
                'codespell',

                -- Make
                'checkmake',
                'shfmt',
                'nixpkgs-fmt',
            })
        end
        return { ensure_installed = ensure_installed }
    end,
    config = function(_, opts)
        require('mason-tool-installer').setup(opts)
    end,
}
