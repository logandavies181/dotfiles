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
      vim.cmd("TransparentEnable")
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
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },
  -- C# just doesn't want to play nice out of the box
  -- Make sure to update ~/.omnisharp/omnisharp.json
  { "Hoffs/omnisharp-extended-lsp.nvim" },

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

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      git = { enable = true },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "csv",
        "c_sharp",
        "dockerfile",
        "go",
        "gomod",
        "gosum",
        "graphql",
        "haskell",
        "html",
        "javascript",
        "jq",
        "lua",
        "make",
        "markdown",
        "python",
        "rego",
        "rust",
        "terraform",
        "xml",
        "yaml",
      },
    },
  },
}

return plugins
