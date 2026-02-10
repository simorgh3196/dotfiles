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
}
