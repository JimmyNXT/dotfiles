-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {

  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  St_time_sep = {
    bg = "one_bg",
    fg = "teal",
  },
  St_time_icon = {
    bg = "teal",
    fg = "one_bg",
  },
  St_time_text = {
    bg = "one_bg",
    fg = "teal",
  },
  St_date_sep = {
    bg = "one_bg",
    fg = "#ffb366",
  },
  St_date_icon = {
    bg = "#ffb366",
    fg = "one_bg",
  },
  St_date_text = {
    bg = "one_bg",
    fg = "#ffb366",
  },
}

return M
