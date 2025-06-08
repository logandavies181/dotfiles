require("lspconfig.configs").graphqlzp = {
  default_config = {
    enabled = true,
    filetypes = {"graphql"},
    cmd = { "/home/logie/src/graphqlzp/zig-out/bin/graphqlzp" },
    root_dir = function (name)
      return require("lspconfig.util").root_pattern({"*.graphql", ".git"})(name)
    end
  }
}

require("lspconfig").graphqlzp.setup {}
