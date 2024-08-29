local version = vim.version().minor

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

local function lsp_msg()
  if version < 10 then
    return ""
  end

  local msg = vim.lsp.status()

  if #msg == 0 or vim.o.columns < 120 then
    return ""
  end

  local spinners = { "", "󰪞", "󰪟", "󰪠", "󰪢", "󰪣", "󰪤", "󰪥" }
  local ms = vim.loop.hrtime() / 1e6
  local frame = math.floor(ms / 100) % #spinners

  return spinners[frame + 1] .. " " .. msg
end

local function lsp()
  if rawget(vim, "lsp") and version >= 10 then
    for _, client in ipairs(vim.lsp.get_clients()) do
      if client.attached_buffers[stbufnr()] then
        return (vim.o.columns > 100 and "   LSP ~ " .. client.name .. " ") or "   LSP "
      end
    end
  end

  return ""
end

local function cwd()
  local icon = "󰉋 "
  local name = vim.loop.cwd()
  name = " " .. (name:match "([^/\\]+)[/\\]*$" or name) .. " "
  return (vim.o.columns > 85 and (icon .. name)) or ""
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "filename",
            file_status = false,
            symbols = {
              unnamed = "[No Name]", -- Text to show for unnamed buffers.
              newfile = "[New]", -- Text to show for newly created file before first write
            },
          },
        },
        lualine_c = {
          { "branch", icon = "" },
          {
            "diff",
            colored = true,
            symbols = { added = " ", modified = " ", removed = " " },
            separator = { right = nil },
          },
          "%=",
          lsp_msg,
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic", "nvim_lsp" },
            sections = { "error", "warn", "info", "hint" },
            diagnostics_color = {
              error = "DiagnosticError",
              warn = "DiagnosticWarn",
              info = "DiagnosticInfo",
              hint = "DiagnosticHint",
            },
            symbols = { error = " ", warn = " ", info = "󰛩 ", hint = "󰋼 " },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
          lsp,
        },
        lualine_y = { cwd },
        lualine_z = { "progress" },
      },
      extensions = {'nvim-tree', 'mason', 'lazy', 'fugitive'}
    }
  end,
}
