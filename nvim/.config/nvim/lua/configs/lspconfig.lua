local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.html.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern "Cargo.toml",
}

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "c", "cpp" },
  root_dir = lspconfig.util.root_pattern(".git"),
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.marksman.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes= {"markdown", "markdown.mdx"}
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
}

lspconfig.bashls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {'bash', 'sh', 'zsh', 'ksh', 'csh'},
}

lspconfig.perlnavigator.setup{
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {'perl'},
  root_dir = lspconfig.util.root_pattern(".git"),
}


lspconfig.rnix.setup{
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"nix"},
}
