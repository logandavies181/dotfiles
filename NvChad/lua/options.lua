require("nvchad.options")

-- Disable netrw as per nvim-tree recs
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.colorcolumn = "120"
opt.confirm = true
opt.errorbells = false
opt.mouse = ""
opt.scrolloff = 8
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.whichwrap = "bs"
opt.wrap = false

require("tabwidth")

require("reopen_same_spot")
