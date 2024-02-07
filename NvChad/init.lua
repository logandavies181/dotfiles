local opt = vim.opt

opt.colorcolumn = "120"
opt.confirm = true
opt.errorbells = false
opt.mouse = ""
opt.scrolloff = 8
opt.shiftwidth = 4
opt.whichwrap = "bs"

require("custom.tabwidth")

require("custom.reopen_same_spot")
