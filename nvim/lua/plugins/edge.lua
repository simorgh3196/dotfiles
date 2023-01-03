local M = {
    "sainnhe/edge",
    lazy = false,
    priority = 1000,
}

function M.config()
    vim.g.edge_style = "neon"
    vim.g.edge_disable_italic_comment = 1
    vim.g.edge_better_performance = 1
    vim.cmd([[colorscheme edge]])
end

return M
