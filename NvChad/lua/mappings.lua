require "nvchad.mappings"

local map = vim.keymap.set

-- escape insert mode
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("i", "jj", "<ESC>", { desc = "Escape insert mode" })
map("i", "JJ", "<ESC>", { desc = "Escape insert mode" })
map("i", "JK", "<ESC>", { desc = "Escape insert mode" })

-- jump around
map("n", "H", "5h", { desc = "Move 5" })
map("n", "J", "5j", { desc = "Move 5" })
map("n", "K", "5k", { desc = "Move 5" })
map("n", "L", "5l", { desc = "Move 5" })
map("v", "H", "5h", { desc = "Move 5" })
map("v", "J", "5j", { desc = "Move 5" })
map("v", "K", "5k", { desc = "Move 5" })
map("v", "L", "5l", { desc = "Move 5" })

map("n", "<C-e>", "5<C-e>", { desc = "Move 5" })
map("n", "<C-y>", "5<C-y>", { desc = "Move 5" })

-- Better pairs
map("i", "{  }", "{<CR>}<ESC>O", { desc = "Enter backets on new line" })
map("i", "(  )", "(<CR>)<ESC>O", { desc = "Enter backets on new line" })
map("i", "[  ]", "[<CR>]<ESC>O", { desc = "Enter backets on new line" })
map("i", "{ }", "{}<ESC>i", { desc = "Enter backets on same line" })
map("i", "( )", "()<ESC>i", { desc = "Enter backets on same line" })
map("i", "[ ]", "[]<ESC>i", { desc = "Enter backets on same line" })
map("i", "\" \"", "\"\"<ESC>i", { desc = "Enter quotes on same line" })
map("i", "''", "''<ESC>i", { desc = "Enter quotes on same line" })

map("n", "]b", ":bnext<CR>", { desc = "Next tab", silent = true })
map("n", "[b", ":bprev<CR>", { desc = "Prev tab", silent = true })

-- Stay in visual mode after indenting
map("v", "<", "<gv", { desc = "Stay in visual mode after indenting" })
map("v", ">", ">gv", { desc = "Stay in visual mode after indenting" })

map("n", "gk",
  function()
    vim.lsp.buf.hover()
  end,
  { desc = "LSP hover" })

map("n", "<leader>fg", "<cmd> Telescope git_files <CR>", { desc = "Repo-wide find files" })

map("n", "<leader>e",
  function()
    require("nvim-tree.api").tree.toggle({find_file = true, update_root = true})
  end,
  { desc = "Toggle NvimTree but better" })
