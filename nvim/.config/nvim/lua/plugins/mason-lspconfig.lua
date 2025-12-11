return {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    opts = {
        ensure_installed = {},
        automatic_installation = false,
    },
    config = function(_, opts)
        require('mason-lspconfig').setup(opts)
    end,
}
