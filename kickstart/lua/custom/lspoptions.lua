return {
  gopls = {},

  omnisharp = {
    handlers = {
      ["textDocument/definition"] = require('omnisharp_extended').handler,
    }
  },

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
