return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "stylua",
        "selene",
        "luacheck",
        "eslint_d",
        "shellcheck",
        "deno",
        "shfmt",
        "black",
        "isort",
        "flake8",
      },
    },
  },

  -- formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        swift = { "swiftformat" },
      },
    },
  },

  -- linting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        swift = { "swiftlint" },
      },
    },
  },
}
