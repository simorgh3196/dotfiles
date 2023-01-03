return {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",

    {
        "folke/which-key.nvim",
        lazy = false,
        config = {
            plugins = {
                presets = {
                    operators = false,
                    motions = false,
                    text_objects = false,
                    windows = false,
                    nav = false,
                    z = true,
                    g = true,
                },
            },
        },
    },

    {
        "nvim-tree/nvim-web-devicons",
        config = { default = true },
    },

    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        config = {
            auto_open = false,
            use_diagnostic_signs = true,
        },
    },
}
