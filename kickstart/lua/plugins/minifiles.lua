local map = require("custom.helpers.map")

Inmini = false

map("n", "<leader>e", function ()
  local minifiles = require("mini.files")
  if not Inmini
  then
    Inmini = true
    minifiles.open(vim.api.nvim_buf_get_name(0))
  else
    Inmini = false
    minifiles.close()
  end
end, nil)

return {
  { "echasnovski/mini.files", version = "*" },
}
