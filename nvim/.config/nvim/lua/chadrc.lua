---@type ChadrcConfig
local M = {}

local highlights = require "highlights"
M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "catppuccin" },

  statusline = {
    order = {"mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor", "time", "date"},
    
    modules = {
      time = function()
        return "%#St_time_sep#%#St_time_icon#󰥔 %#St_time_text#" .. os.date " %H:%M "
      end,
      date = function()
        return "%#St_date_sep#%#St_date_icon#𝍄 %#St_date_text#" .. os.date " %d/%m/%Y "
      end
    
    }
  },
  tabufline = {
      lazyload = false,
  },
  hl_override = highlights.override,
  hl_add = highlights.add,
}

return M
