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
    ["<C-e>"] = {"5<C-e>"},
    ["<C-y>"] = {"5<C-y>"},
    ["]b"] = {":bnext<CR>", opts = { silent = true}},
    ["[b"] = {":bprev<CR>", opts = { silent = true}},
    ["gk"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },
  },
  v = {
    ["H"] = {"5h"},
    ["J"] = {"5j"},
    ["K"] = {"5k"},
    ["L"] = {"5l"},
  },
}

return M
