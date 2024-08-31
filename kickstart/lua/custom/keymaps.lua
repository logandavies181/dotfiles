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

-- Omnisharp extended bits
vim.api.nvim_create_autocmd('BufEnter', {
  desc = "Use omnisharp-extended features",
  pattern = "*.cs",
  callback = function()
    map("n", "gd", require('omnisharp_extended').lsp_definition)
  end,
})

map("n", "gk", vim.lsp.buf.hover, { desc = "LSP hover" })
-- kickstart lsp mappings
map("n", 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efinition'} )
map("n", 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences'} )
map("n", 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation'} )
map("n", '<leader>D', require('telescope.builtin').lsp_type_definitions, { desc = 'Type [D]efinition'} )
map("n", '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols'} )
map("n", '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols'} )
map("n", '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame'} )
map("n", '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction'} )
map("n", 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration'} )
