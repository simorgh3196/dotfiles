-- stylua: ignore
if not vim.g.vscode then return {} end

-- Disable plugins when in vscode
return {
  { "folke/trouble.nvim", enabled = false },
}
