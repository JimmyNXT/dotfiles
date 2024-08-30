return {
  "williamboman/mason.nvim",
  config = function()
    -- dofile(vim.g.base46_cache .. "mason")
    local ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- Vim stuff
        "vim-language-server",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",

        "prettier",

        -- c/cpp stuff 
        -- "clangd",
        "clang-format",
        "eslint-lsp",
        "pyright",
        "black",

        -- Markdown
        "marksman",

        -- Nix
        -- "rnix-lsp",
        -- "nixpkgs-fmt",

        -- Java
        -- "jdtls",
      }
    require("mason").setup {

      ensure_installed = ensure_installed,
    }
    vim.api.nvim_create_user_command("MasonInstallAll", function()
        if ensure_installed and #ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
        end
      end, {})

      vim.g.mason_binaries_list = ensure_installed
  end,
}
