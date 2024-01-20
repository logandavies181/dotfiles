---@type ChadrcConfig
local M = {}

M.ui = {
  changed_themes = {
    gruvbox = {
      base_30 = {
        grey_fg = "#7e7e6e"
      }
    }
  },
  theme = "gruvbox",
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
