vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1

    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    if not real_file and not no_name then
      return
    end

    -- local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    --
    -- if not no_name then
    --   return
    -- end

    require("nvim-tree.api").tree.toggle { focus = false, find_file = true }
  end,
})
