local function replace(s)
  local sb = {}
  for i = 1, #s do
    local v = s:sub(i, i)
    if v == "\\" then    table.insert(sb, "/")
    elseif v == "/" then table.insert(sb, "\\")
    elseif v == "<" then table.insert(sb, ">")
    elseif v == ">" then table.insert(sb, "<")
    else                 table.insert(sb, v)
    end
  end

  return table.concat(sb)
end

local left = [[
      .:/
  ,,///;,   ,;/
 o:::::::;;///
>::::::::;;\\\
  ''\\\\\'" ';\
     ';\
]]
local right = (function ()
  local parts = {}
  for s in left:gmatch("([^(\n|\r\n)]+)") do
    s = replace(s)
    table.insert(parts, s:reverse())
  end
  return table.concat(parts, "\n")
end)()

return {
  "logandavies181/fishtank.nvim",
  opts = {
    screensaver = {
      --enabled = false,
      timeout = 60000,
    },
    sprite = {
      color = '#88aaff',
      left = left,
      right = right,
    },
    numberOfFish = 3,
  },
  config = function(_, opts)
      local fishtank = require('fishtank')
      fishtank.setup(opts)
  end,
}
