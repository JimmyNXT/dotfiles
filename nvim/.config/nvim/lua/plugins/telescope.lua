return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      local temp_opts = require "nvchad.configs.telescope"
      temp_opts.vimgrep_arguments = {
					"grep",
					"--extended-regexp",
					"--color=never",
					"--with-filename",
					"--line-number",
					"-b", -- grep doesn't support a `--column` option :(
					"--ignore-case",
					"--recursive",
					"--no-messages",
					"--exclude-dir=*cache*",
					"--exclude-dir=*.git",
					"--exclude=.*",
					"--binary-files=without-match"
				}
      return temp_opts
    end,
}
