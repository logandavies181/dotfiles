return {
  gopls = {},

  -- add the overridden handlers in autocmd in keymaps.lua
  omnisharp = {},

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
