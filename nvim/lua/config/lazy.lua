-- bootstrap from github
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("config.plugins", {
    defaults = {
        lazy = true,
        version = "*",
    },
    install = {
        colorscheme = { "edge" }
    },
    checker = {
        enabled = true
    },
    diff = {
        cmd = "terminal_git"
    },
    performance = {
        cache = {
            enabled = true,
        },
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
    -- ui = {
    --     custom_keys = {
    --         ["<localleader>d"] = function(plugin)
    --             dd(plugin)
    --         end,
    --     },
    -- },
})

vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")
