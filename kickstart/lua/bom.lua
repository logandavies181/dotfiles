local api = vim.api

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  callback = function()
    if not vim.bo[0].bomb then
      return
    end

    local ns_id = api.nvim_create_namespace("bomb")

    local line_num = 0
    local col_num = 0

    local opts = {
      end_col = 0,
      end_row = 0,
      id = 1,
      virt_text = {{"💣"}},
      virt_text_pos = "eol",
    }

    api.nvim_buf_set_extmark(0, ns_id, line_num, col_num, opts)
  end
})
