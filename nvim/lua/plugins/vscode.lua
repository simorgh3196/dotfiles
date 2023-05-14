-- stylua: ignore
if not vim.g.vscode then return {} end

-- Disable plugins when in vscode
return {
  ----- Coding -----

  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },

  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },

  {
    "echasnovski/mini.ai",
    keys = {
      { "a", mode = { "x", "o" } },
      { "i", mode = { "x", "o" } },
    },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          -- no need to load the plugin, since we only need its queries
          require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        end,
      },
    },
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },
      }
    end,
    config = function(_, opts)
      local ai = require("mini.ai")
      ai.setup(opts)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    init = function()
      -- no need to load the plugin, since we only need its queries
      require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
    end,
  },

  ----- Edito -----

  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
    end,
  },

  { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } },

  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = "BufReadPost",
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Schrink selection", mode = "x" },
    },
    ---@type TSConfig
    opts = {
      highlight = { enable = false },
      indent = { enable = false },
      context_commentstring = { enable = false, enable_autocmd = false },
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "swift",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
    },
    ---@param opts TSConfig
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  ----- Util -----

  { "tpope/vim-repeat", event = "VeryLazy" },

  ----- Custom -----

  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
        },
      })
    end,
  },

  {
    "mfussenegger/nvim-treehopper",
    keys = { { "m", mode = { "o", "x" } } },
    opts = function()
      vim.cmd([[
        omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
        xnoremap <silent> m :lua require('tsht').nodes()<CR>
        ]])
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },

  {
    "Wansmer/treesj",
    keys = {
      { "J", "<cmd>TSJToggle<cr>" },
    },
    config = function()
      local u = require("treesj.langs.utils")

      require("treesj").setup({
        use_default_keymaps = false,
        langs = {
          dart = {
            argument_list = u.set_preset_for_args(),
            formal_parameters = u.set_preset_for_args(),
            block = u.set_preset_for_statement(),
            constructor_body = u.set_preset_for_statement(),
            array_initializer = u.set_preset_for_list(),
            annotation_argument_list = u.set_preset_for_args(),
            enum_body = u.set_preset_for_dict(),
            enum_declaration = {
              target_nodes = { "enum_body" },
            },
            if_statement = {
              target_nodes = { "block" },
            },
            annotation = {
              target_nodes = { "annotation_argument_list" },
            },
            method_declaration = {
              target_nodes = { "block" },
            },
            variable_declarator = {
              target_nodes = { "array_initializer" },
            },
            constructor_declaration = {
              target_nodes = { "constructor_body" },
            },
          },
        },
      })
    end,
  },

  {
    "keaising/im-select.nvim",
    event = "VeryLazy",
    opts = {
      default_im_select = "com.apple.keylayout.ABC",
      disable_auto_restore = 1,
    },
  },
}
