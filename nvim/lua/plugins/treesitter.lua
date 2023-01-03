return {
    {
        "Wansmer/treesj",
        keys = {
            { "J", "<cmd>TSJToggle<cr>" },
        },
        config = { use_default_keymaps = false },
    },

    {
        "m-demare/hlargs.nvim",
        event = "VeryLazy",
        enabled = false,
        config = {
            excluded_argnames = {
                usages = {
                    lua = { "self", "use" },
                },
            },
        },
    },

    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

    {
        "mfussenegger/nvim-treehopper",
        keys = {
            { "m", mode = { "o", "x" } } 
        },
        config = function()
            vim.cmd([[
                omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
                xnoremap <silent> m :lua require('tsht').nodes()<CR>
            ]])
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "BufReadPost",
        dependencies = {
            "p00f/nvim-ts-rainbow",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "mfussenegger/nvim-ts-hint-textobject",
            "windwp/nvim-ts-autotag",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "cmake",
                    -- "comment", -- comments are slowing down TS bigtime, so disable for now
                    "cpp",
                    "css",
                    "dart",
                    "diff",
                    "dockerfile",
                    "fish",
                    "gitignore",
                    "go",
                    "gomod",
                    "graphql",
                    "help",
                    "html",
                    "http",
                    "java",
                    "javascript",
                    "jsdoc",
                    "json",
                    "jsonc",
                    "kotlin",
                    "latex",
                    "lua",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "meson",
                    "ninja",
                    "nix",
                    "norg",
                    "org",
                    "php",
                    "python",
                    "query",
                    "regex",
                    "ruby",
                    "rust",
                    "scss",
                    "sql",
                    "svelte",
                    "swift",
                    "teal",
                    "toml",
                    "tsx",
                    "typescript",
                    "vhs",
                    "vim",
                    "vue",
                    "wgsl",
                    "yaml",
                },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = "<C-s>",
                        node_decremental = "<C-bs>",
                    },
                },
                query_linter = {
                    enable = true,
                    use_virtual_text = true,
                    lint_events = { "BufWrite", "CursorHold" },
                },
                textsubjects = {
                    enable = true,
                    keymaps = {
                        ["."] = "textsubjects-smart",
                        [";"] = "textsubjects-container-outer",
                    },
                },
                playground = {
                    enable = true,
                    disable = {},
                    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                    persist_queries = true, -- Whether the query persists across vim sessions
                    keybindings = {
                        toggle_query_editor = "o",
                        toggle_hl_groups = "i",
                        toggle_injected_languages = "t",
                        toggle_anonymous_nodes = "a",
                        toggle_language_display = "I",
                        focus_language = "f",
                        unfocus_language = "F",
                        update = "R",
                        goto_node = "<cr>",
                        show_help = "?",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]c"] = "@class.outer",
                        },
                        goto_next_end = { 
                            ["]F"] = "@function.outer",
                            ["]C"] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[c"] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.outer",
                            ["[C"] = "@class.outer",
                        },
                    },
                    lsp_interop = {
                        enable = false,
                        peek_definition_code = {
                            ["gD"] = "@function.outer",
                        },
                    },
                },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_liens = 2000,
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
            })
            -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            -- parser_config.markdown.filetype_to_parsername = "octo"
        end,
    },
}
