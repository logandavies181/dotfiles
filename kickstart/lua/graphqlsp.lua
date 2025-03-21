require("lspconfig.configs").graphqlsp = {
  default_config = {
    enabled = true,
    filetypes = {"graphql"},
    cmd = { "graphqlsp" },
    root_dir = function (name)
      return require("lspconfig.util").root_pattern({".git", "/tmp"})(name)
    end
  }
}

require("lspconfig").graphqlsp.setup {}
