-- bootstrap from github
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable", -- latest stable release
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })

    -- Will update to:
    -- vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    -- vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
    defaults = { lazy = true },
    install = { colorscheme = { "edge" } },
    checker = { enabled = true },
    diff = { cmd = "terminal_git" },
    performance = {
        cache = { enabled = true },
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
                "nvim-treesitter-textobjects",
            },
        },
    },
})

vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")
