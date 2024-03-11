local configs = require("nvchad.configs.lspconfig")

local on_init = configs.on_init
local capabilities = configs.capabilities

local on_attach = function(client, bufnr)
  configs.on_attach(client, bufnr)
  vim.keymap.set("n", "K", "5k", { buffer = bufnr, desc = "Jump 5"})
end

local lspconfig = require("lspconfig")
local servers = {
  "bashls",
  "cssls",
  "html",
  "lua_ls",
  "gopls",
  "pyright",
  "rust_analyzer",
  "tsserver",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- C# specific config zzzzz https://github.com/Decodetalkers/csharpls-extended-lsp.nvim?tab=readme-ov-file#usage
local cs_config = {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler,
  },
}
require'lspconfig'.omnisharp.setup(cs_config)
-- end C# specific
