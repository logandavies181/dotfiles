vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {"*"},
  callback = function()
    local treesitter = require('nvim-treesitter')
    local ft = vim.bo.filetype
    local lang = vim.treesitter.language.get_lang(ft)

    for _, val in pairs(treesitter.get_available()) do
      if val == lang then
        treesitter.install(lang):await(function ()
          vim.treesitter.start(0, lang)
        end)
      end
    end
  end,
})

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
}
