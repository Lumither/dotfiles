return {
    "folke/trouble.nvim",
    opts = {
        warn_no_results = false,
        open_no_results = true,
    },
    cmd = "Trouble",
    keys = {
        {
            "<leader>E",
            function()
                require("trouble").toggle("diagnostics", { focus = true })
            end,
            desc = "Diagnostics (Trouble, Focused)",
        },
        {
            "<leader>e",
            function()
                vim.lsp.buf.hover()
            end,
            desc = "Show error description",
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
