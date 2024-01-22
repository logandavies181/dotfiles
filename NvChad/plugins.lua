local plugins = {
  -- pairs can kick rocks
  { "windwp/nvim-autopairs", enabled = false },

  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function(_, opts)
      require("notify").setup(vim.tbl_extend("keep", {
        -- other stuff
        background_colour = "#000000",
      }, opts))
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- ensure_installed = {
      --   "csharp_ls",
      --   "gopls",
      -- }
      automatic_installation = true,
    },
    -- config = function(_, opts)
    --   require("mason-lspconfig").setup(opts)
    --   require("mason-lspconfig").setup_handlers {
    --     function(server_name)  -- default handler (optional)
    --       require("lspconfig")[server_name].setup {}
    --     end,
    --   }
    -- end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },

  -- fun UI stuff for commands
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}

return plugins
