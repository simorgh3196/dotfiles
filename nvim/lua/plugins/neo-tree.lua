return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            {
                "s1n7ax/nvim-window-picker",
                config = {
                    autoselect_one = true,
                    include_current = false,
                    filter_rules = {
                        -- filter using buffer options
                        bo = {
                            -- if the file type is one of following, the window will be ignored
                            filetype = { "neo-tree", "neo-tree-popup", "notify" },

                            -- if the buffer type is one of following, the window will be ignored
                            buftype = { "terminal", "quickfix" },
                        },
                    },
                    other_win_hl_color = "#e35e4f",
                },
            },
        },
        keys = {
            {
                "<leader>ft",
                function()
                    require("neo-tree.command").execute({ toggle = true, dir = require("util").get_root() })
                end,
                desc = "NeoTree",
            },
        },
        config = function()
            -- Unless you are still migrating, remove the deprecated commands from v1.x
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

            require("neo-tree").setup({
                filesystem = {
                    follow_current_file = true,
                    hijack_netrw_behavior = "open_current",
                },
            })
        end,
    },
}
