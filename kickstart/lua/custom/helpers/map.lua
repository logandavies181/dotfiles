return function(mode, bef, aft, opts)
  opts = opts or {}
  opts.noremap = true
  opts.silent = true
  vim.keymap.set(mode, bef, aft, opts)
end
