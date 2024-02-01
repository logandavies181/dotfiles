-- seriously why won't people respect go tabwidth
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "go",
  command = "setlocal shiftwidth=8 softtabstop=8 tabstop=8 noexpandtab",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "lua",
  command = "setlocal shiftwidth=2",
})
