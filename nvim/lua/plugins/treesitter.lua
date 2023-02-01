return {
  {
    "mfussenegger/nvim-treehopper",
    keys = { { "m", mode = { "o", "x" } } },
    opts = function()
      vim.cmd([[
        omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
        xnoremap <silent> m :lua require('tsht').nodes()<CR>
      ]])
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },
}
