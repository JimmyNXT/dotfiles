if vim.g.is_nixos then
    return {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = {}, -- etc, for non-nix systems
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        },
    }
else
    return { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                'c',
                'cpp',
                'css',
                'dockerfile',
                'git_config',
                'git_rebase',
                'gitattributes',
                'gitcommit',
                'gitignore',
                'go',
                'html',
                'java',
                'javadoc',
                'javascript',
                'lua',
                'make',
                'markdown',
                'markdown_inline',
                'mermaid',
                'nginx',
                'nix',
                'passwd',
                'pem',
                'perl',
                'printf',
                'python',
                'regex',
                'rust',
                'sql',
                'ssh_config',
                'tsx',
                'typescript',
                'vim',
            },
            auto_install = true,
            highlight = {
                enable = true,
                -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                --  If you are experiencing weird indenting issues, add the language to
                --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                additional_vim_regex_highlighting = { 'ruby' },
                use_languagetree = true,
            },
            indent = { enable = true, disable = { 'ruby' } },
        },
        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    }
end
