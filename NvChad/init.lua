local opt = vim.opt

opt.colorcolumn = "120"
opt.errorbells = false
opt.mouse = ""
opt.confirm = true
opt.whichwrap = "bs"

-- seriously why won't people respect go tabwidth
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "go",
  command = "setlocal shiftwidth=8 softtabstop=8 tabstop=8 noexpandtab",
})

require("custom.reopen_same_spot")
