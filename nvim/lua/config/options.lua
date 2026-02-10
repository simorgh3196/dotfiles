vim.g.mapleader = " "

if vim.g.vscode == 1 then
  vim.g.laststatus = 0
else
  require("util.status")
end

-- Add japanese to spelllang
vim.opt.spelllang = { "en", "cjk" }

-- Enable this option to avoid conflicts with Prettier.
vim.g.lazyvim_prettier_needs_config = true
