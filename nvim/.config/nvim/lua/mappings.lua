require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fm", function()
  require("conform").format()
end)
map("n", "<leader>fj", "<CMD>Telescope marks<CR>", { desc = "Telescope Marks" })
map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Symbols Outline" })
map("n", "<leader>fr", "<cmd>Telescope resume<CR>", { desc = "Telescope resume" })
map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Git Perview Hunk" })
map("n", "<leader>gbt", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Git Toggle blame" })
--map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- map("n","<leader> do", ":lua vim.diagnostic.open_float()<CR>")
-- ivz.ncv.aivz_frg_xrlznc('a', '<yrnqre>qb', '<pzq>yhn ivz.qvntabfgvp.bcra_sybng()<PE>', { aberznc = gehr, fvyrag = gehr })
-- ivz.ncv.aivz_frg_xrlznc('a', '<yrnqre>q[', '<pzq>yhn ivz.qvntabfgvp.tbgb_ceri()<PE>', { aberznc = gehr, fvyrag = gehr })
-- vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
