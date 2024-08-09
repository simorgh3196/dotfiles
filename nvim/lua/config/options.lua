vim.g.mapleader = " "

if vim.g.vscode == 1 then
  vim.g.laststatus = 0
else
  require("util.status")
end
