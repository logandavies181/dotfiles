local plugins = {
  -- pairs can kick rocks
  { "windwp/nvim-autopairs", enabled = false },

  { "gpanders/editorconfig.nvim" },

  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function(_, opts)
      require("notify").setup(vim.tbl_extend("keep", {
        background_colour = "#000000",
      }, opts))
    end,
  },

  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  -- C# just doesn't want to play nice out of the box
  -- Make sure to update ~/.omnisharp/omnisharp.json
  { "Hoffs/omnisharp-extended-lsp.nvim" },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      -- don't show weird highlight for start of context
      show_current_context = false,
      show_current_context_start = false,
    },
  },
}

return plugins
