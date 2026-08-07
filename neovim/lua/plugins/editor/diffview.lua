return {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    opts = {
        enhanced_diff_hl = true,
    },
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff working tree" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
        { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch history" },
        { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
    },
}
