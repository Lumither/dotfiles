return {
    "folke/trouble.nvim",
    opts = {
        warn_no_results = false,
        open_no_results = true,
        icons = {
            folder_closed = "+ ",
            folder_open = "- ",
        },
        win = {},
        modes = {
            symbols = {
                focus = true,
                win = {
                    position = "right",
                    size = 40,
                },
            },
        },
    },
    cmd = "Trouble",
    keys = {
        {
            "<leader>e",
            function()
                vim.diagnostic.open_float({ scope = "cursor" })
            end,
            desc = "Show diagnostic at cursor",
        },
        {
            "<leader>E",
            function()
                require("trouble").toggle("diagnostics", { focus = true })
            end,
            desc = "Toggle diagnostics overview",
        },
        {
            "]e",
            function()
                vim.diagnostic.goto_next({ float = true })
            end,
            desc = "Next diagnostic",
        },
        {
            "[e",
            function()
                vim.diagnostic.goto_prev({ float = true })
            end,
            desc = "Previous diagnostic",
        },
    },
}
