local M = {}

M.logie = {
  i = {
    ["jj"] = {"<ESC>"},
    ["jk"] = {"<ESC>"},
    ["JJ"] = {"<ESC>"},
    ["JK"] = {"<ESC>"},
  },
  n = {
    ["H"] = {"5h"},
    ["J"] = {"5j"},
    ["K"] = {"5k"},
    ["L"] = {"5l"},
    ["gk"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },
    ["]b"] = {":bnext<CR>", opts = { silent = true}},
    ["[b"] = {":bprev<CR>", opts = { silent = true}},
  },
  v = {
    ["H"] = {"5h"},
    ["J"] = {"5j"},
    ["K"] = {"5k"},
    ["L"] = {"5l"},
  },
}

return M
