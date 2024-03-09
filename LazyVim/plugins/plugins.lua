-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

-- for nvim-tree keybinds
local function nvim_tree_on_attach(bufnr)
    local api = require("nvim-tree.api")
  
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
  
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
  
    -- custom mappings
    --im.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
    --im.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
  end
  
  return {
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },
  
    -- Configure LazyVim to load gruvbox
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "gruvbox",
      },
    },
  
    {
      "xiyaowong/transparent.nvim",
      opts = {
        groups = { -- table: default groups
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLineNr",
          "EndOfBuffer",
        },
      },
      config = function(_, opts)
        require("notify").setup(vim.tbl_extend("keep", {
          -- other stuff
          background_colour = "#000000",
        }, opts))
      end,
    },
  
    {
      "hashivim/vim-terraform",
    },
  
    {
      "neovim/nvim-lspconfig",
      init = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        keys[#keys + 1] = { "K", false }
        keys[#keys + 1] = { "gk", vim.lsp.buf.hover, desc = "Hover" }
      end,
    },
  
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "go",
          "c_sharp",
          "hcl",
        },
      },
    },
  
    { "ggandor/leap.nvim", enabled = false },
    { "ggandor/flit.nvim", enabled = false },
  
    -- low-key I actually hate this
    { "echasnovski/mini.pairs", enabled = false },
  
    {
      "L3MON4D3/LuaSnip",
      keys = function()
        return {}
      end,
    },
    -- then: setup supertab in cmp
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-emoji",
      },
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
        local has_words_before = function()
          unpack = unpack or table.unpack
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
  
        local luasnip = require("luasnip")
        local cmp = require("cmp")
  
        opts.mapping = vim.tbl_extend("force", opts.mapping, {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
              -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
              -- this way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        })
      end,
    },
  }
  