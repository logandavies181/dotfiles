local function map(mode, bef, aft, opts)
  opts = opts or {}
  opts.noremap = true
  opts.silent = true
  vim.keymap.set(mode, bef, aft, opts)
end

map('i', 'jj', '<Esc>', { desc = 'Quick esc' })
map('i', 'jk', '<Esc>', { desc = 'Quick esc' })
map('i', 'JJ', '<Esc>', { desc = 'Quick esc' })
map('i', 'JK', '<Esc>', { desc = 'Quick esc' })

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

map("n", "]b", ":tabnext<CR>", { desc = "Next tab" })
map("n", "[b", ":tabprev<CR>", { desc = "Prev tab" })

-- Stay in visual mode after indenting
map("v", "<", "<gv", { desc = "Stay in visual mode after indenting" })
map("v", ">", ">gv", { desc = "Stay in visual mode after indenting" })

map("n", "gk",
  function()
    vim.lsp.buf.hover()
  end,
  { desc = "LSP hover" })

map("n", "<leader>fg", "<cmd> Telescope git_files <CR>", { desc = "Repo-wide find files" })

local function jump_to_diagnostic(diagnostic_fn)
  return function()
    local diag = diagnostic_fn()
    if diag ~= nil
    then
      vim.diagnostic.jump({ diagnostic = diag , float = true })
    else
      print("No errors!")
    end
  end
end
local goto_next_diag = jump_to_diagnostic(vim.diagnostic.get_next)
local goto_prev_diag = jump_to_diagnostic(vim.diagnostic.get_prev)

map("n", "]d", goto_next_diag)
map("n", "[d", goto_prev_diag)

map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
