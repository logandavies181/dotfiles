return {

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000 ,
    config = true,
    opts = {
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
    },
  },

  {
    'gbprod/yanky.nvim',
    opts = {},
  },

  { "gpanders/editorconfig.nvim" },

  {
    "xiyaowong/transparent.nvim",
    config = function(_, opts)
      require("notify").setup(vim.tbl_extend("keep", {
        background_colour = "#000000",
      }, opts))
      require('transparent').clear_prefix('Neotree')
      vim.cmd("TransparentEnable")
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  { 'echasnovski/mini.comment', version = '*' },

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      local highlight = { "CursorColumn" }
      require('ibl').setup({
        scope = { enabled = false },
        indent = { char = "┊", },
      })
    end
  },

  { "Hoffs/omnisharp-extended-lsp.nvim" },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = 'gruvbox',
    },
  },

  { 'alvarosevilla95/luatab.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, opts = {}, },
}
