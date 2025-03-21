return {
  "xiyaowong/transparent.nvim",
  config = function(_, opts)
    require("notify").setup(vim.tbl_extend("keep", {
      background_colour = "#000000",
    }, opts))
    require('transparent').clear_prefix('Neotree')
    vim.cmd("TransparentEnable")
  end,
}
