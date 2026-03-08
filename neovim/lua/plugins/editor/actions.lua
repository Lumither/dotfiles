return {
    {
        "aznhe21/actions-preview.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        keys = {
            {
                "<A-CR>",
                function()
                    require("actions-preview").code_actions()
                end,
                mode = { "n", "v" },
                desc = "Code action (preview)",
            },
        },
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
        opts = {},
        keys = {
            {
                "<A-S-CR>",
                function()
                    require("refactoring").select_refactor()
                end,
                mode = { "n", "v" },
                desc = "Refactor menu",
            },
        },
    },
}
