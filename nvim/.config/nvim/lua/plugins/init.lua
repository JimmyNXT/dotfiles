require "options"
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      dofile(vim.g.base46_cache .. "treesitter")
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "configs.nvimtree"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function()
      return require "configs.mason"
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
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      return require "configs.lint"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = function()
      return require "configs.obsidian"
    end,
    config = function(_, opts)
      vim.o.conceallevel = 1
      require("obsidian").setup(opts)
    end,
  },

  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },

    opts = function()
      return require "configs.outline"
    end,
    config = function(_, opts)
      require("outline").setup(opts)
    end,
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
    event = "VeryLazy",
    dependencies = {
      "tpope/vim-rhubarb",
      "tpope/vim-obsession",
      "tpope/vim-unimpaired",
    },
  },
  {
    "sQVe/sort.nvim",
    lazy = false,
    opts = function ()
      return require "configs.sort"
    end,
    config = function (_, opts)
      require("sort").setup({opts})
    end,
  }

  -- {
  --   "mfussenegger/nvim-jdtls",
  --   ft = "java",
  --   lazy = true,
  --   opts = function ()
  --     return require("configs.java")
  --   end,
  --   config = function (_, opts)
  --     require("jdtls").start_or_attach(opts)
  --   end
  -- },
}
