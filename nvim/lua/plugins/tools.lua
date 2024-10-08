return {
  {
    {
      "Wansmer/treesj",
      requires = { "nvim-treesitter" },
      -- keys = {
      --   { "J", "<cmd>TSJToggle<cr>" },
      -- },
      config = function()
        local lang_utils = require("treesj.langs.utils")

        require("treesj").setup({
          use_default_keymaps = false,
          langs = {
            swift = {
              collection_literal = lang_utils.set_default_preset({
                both = {
                  separator = ",",
                },
              }),
              value_arguments = lang_utils.set_default_preset({
                both = {
                  separator = ",",
                },
              }),
              statements = lang_utils.set_preset_for_non_bracket({
                split = {
                  recursive_ignore = {
                    "value_arguments",
                    "function_value_parameters",
                  },
                },
                join = {
                  force_insert = ";",
                  no_insert_if = {
                    lang_utils.helpers.if_penultimate,
                  },
                },
              }),
              lambda_literal = {
                target_nodes = {
                  "statements",
                },
              },
              function_body = {
                target_nodes = {
                  "statements",
                },
              },
              property_declaration = {
                target_nodes = {
                  "collection_literal",
                  "value_arguments",
                },
              },
              function_value_parameters = lang_utils.set_preset_for_args(),
            },
          },
        })
      end,
    },
  },

  {
    "keaising/im-select.nvim",
    event = "VeryLazy",
    opts = {
      default_im_select = "com.apple.keylayout.ABC",
      set_previous_events = {},
    },
  },

  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>sR",
        function()
          require("ssr").open()
        end,
        mode = { "n", "x" },
        desc = "Structural Replace",
      },
    },
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
    end,
  },

  -- markdown preview
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>op",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Peek (Markdown Preview)",
      },
    },
    opts = { theme = "light" },
  },

  -- better diffing
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
  },

  -- Commands like vscode
  {
    "mrjones2014/legendary.nvim",
    lazy = true,
    cmd = "Legendary",
    opts = {
      which_key = {
        auto_register = true,
        do_binding = false,
      },
      scratchpad = {
        view = "float",
        results_view = "float",
        keep_contents = true,
      },
      sort = {
        -- sort most recently used item to the top
        most_recent_first = true,
        -- sort user-defined items before built-in items
        user_items_first = true,
        frecency = {
          -- the directory to store the database in
          db_root = string.format("%s/legendary/", vim.fn.stdpath("data")),
          -- the maximum number of timestamps for a single item
          -- to store in the database
          max_timestamps = 10,
        },
      },
      -- Directory used for caches
      cache_path = string.format("%s/legendary/", vim.fn.stdpath("cache")),
      -- Log level, one of 'trace', 'debug', 'info', 'warn', 'error', 'fatal'
      log_level = "info",
    },
    dependencies = {
      { "kkharji/sqlite.lua" },
      { "stevearc/dressing.nvim" },
      -- Please don't remove which-key.nvim otherwise you need to set timeoutlen=300 at `lua/core/options.lua`
      { "folke/which-key.nvim" },
    },
  },
}
