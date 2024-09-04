return {
  "williamboman/mason.nvim",
  opts = function()
    return {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

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

        -- Perl
        "perlnavigator",
      },
    }
  end,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "mason")
    require("mason").setup(opts)

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      if opts.ensure_installed and #opts.ensure_installed > 0 then
        vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
      end
    end, {})

    vim.g.mason_binaries_list = opts.ensure_installed
  end,
}
