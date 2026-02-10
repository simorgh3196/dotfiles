-- iOS  development
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.podspec", "Podfile", "Appfile", "Fastfile", "Matchfile", "Pluginfile" },
  command = "set filetype=ruby",
})

-- Cursor Editor - Project Rules
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.mdc" },
  command = "set filetype=markdown",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = false
  end,
})
