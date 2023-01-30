return {
  {
    {
      "Wansmer/treesj",
      keys = {
        { "J", "<cmd>TSJToggle<cr>" },
      },
      config = { use_default_keymaps = false },
    },
  },

  {
    "keaising/im-select.nvim",
    event = "VeryLazy",
    config = {
      default_im_select = "com.apple.keylayout.ABC",
    },
  },
}
