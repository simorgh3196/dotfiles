-- Gets the root dir from either:
-- * connected lsp
-- * .git from file
-- * .git from cwd
-- * cwd
-- -@param opts? table
local function project_files(opts)
    opts = opts or {}
    opts.cwd = require("util").get_root()
    require("telescope.builtin").find_files(opts)
end

return {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
        "nvim-telescope/telescope-project.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        -- { "nvim-telescope/telescope-frecency.nvim", dependencies = { "kkharji/sqlite.lua" } },
        -- "jvgrootveld/telescope-zoxide",
        -- "nvim-telescope/telescope-live-grep-args.nvim"
    },
    -- keys = {
    --     { "<leader><space>", project_files, desc = "Find File" },
    -- },
    config = function()
        local telescope = require("telescope")
        local borderless = false
        telescope.setup({
            defaults = {
                initial_mode = "insert",
                prompt_prefix = " ",
                selection_caret = " ",
                entry_prefix = " ",
                scroll_strategy = "limit",
                results_title = false,
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top",
                    horizontal = {
                        preview_width = 0.75,
                    },
                },
                path_display = { "absolute" },
                file_ignore_patterns = { ".git/", ".cache", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
                sorting_strategy = "ascending",
                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                file_sorter = require("telescope.sorters").get_fuzzy_file,
                generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                winblend = borderless and 0 or 10,
                mappings = {
                    i = {
                        ["<c-t>"] = function(...)
                            return require("trouble.providers.telescope").open_with_trouble(...)
                        end,
                        -- ["<C-i>"] = function(...)
                        --     project_files({ no_ignore = true })
                        -- end,
                        -- ["<C-h>"] = function(...)
                        --     project_files({ hidden = true })
                        -- end,
                        ["<C-Down>"] = function(...)
                            return require("telescope.actions").cycle_history_next(...)
                        end,
                        ["<C-Up>"] = function(...)
                            return require("telescope.actions").cycle_history_prev(...)
                        end,
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = false,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                project = {
                    base_dirs = {
                        { "$GOPATH/src", max_depth = 3 },
                    },
                },
                frecency = {
                    show_scores = true,
                    show_unindexed = true,
                    ignore_patterns = { "*.git/*", "*/tmp/*" },
                },
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    -- define mappings, e.g.
                    mappings = { -- extend mappings
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                },
            }
        })
        telescope.load_extension("notify")
        telescope.load_extension("fzf")
        telescope.load_extension("project")
        -- telescope.load_extension("zoxide")
        -- telescope.load_extension("frecency")
        -- telescope.load_extension("live_grep_args")
    end,
}
