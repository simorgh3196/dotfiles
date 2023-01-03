local M = {
    "folke/noice.nvim",
    event = "VeryLazy",
}

function M.config()
    local focused = true
    vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
            focused = true
        end,
    })
    vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
            focused = false
        end,
    })
    require("noice").setup({
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        routes = {
            {
                filter = {
                    cond = function()
                        return not focused
                    end,
                },
                view = "notify_send",
                opts = { stop = false },
            },
            {
                filter = {
                    event = "msg_show",
                    find = "%d+L, %d+B",
                },
                view = "mini",
            },
        },
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = true, -- enables an input dialog for inc-rename.nvim
        },
        -- commands = {
        --     all = {
        --         -- options for the message history that you get with `:Noice`
        --         view = "split",
        --         opts = { enter = true, format = "details" },
        --         filter = {},
        --     },
        -- },
    })

    vim.keymap.set("c", "<S-Enter>", function()
        require("noice").redirect(vim.fn.getcmdline())
    end, { desc = "Redirect Cmdline" })

    vim.keymap.set("n", "<leader>nl", function()
        require("noice").cmd("last")
    end, { desc = "Noice Last Message" })

    vim.keymap.set("n", "<leader>nh", function()
        require("noice").cmd("history")
    end, { desc = "Noice History" })

    vim.keymap.set("n", "<leader>na", function()
        require("noice").cmd("all")
    end, { desc = "Noice All" })

    vim.keymap.set("n", "<c-f>", function()
        if not require("noice.lsp").scroll(4) then
            return "<c-f>"
        end
    end, { silent = true, expr = true })

    vim.keymap.set("n", "<c-b>", function()
        if not require("noice.lsp").scroll(-4) then
            return "<c-b>"
        end
    end, { silent = true, expr = true })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
            vim.schedule(function()
                require("noice.text.markdown").keys(event.buf)
            end)
        end,
    })
end

return M
