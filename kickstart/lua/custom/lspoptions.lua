return {
  gopls = {},

  -- add the overridden handlers in autocmd in keymaps.lua
  omnisharp = {},

  tsserver = {},

  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
}
