return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
        signcolumn = false,
        numhl = true,
    },
    keys = {
        { "]h", function() require("gitsigns").nav_hunk("next") end, desc = "Next hunk" },
        { "[h", function() require("gitsigns").nav_hunk("prev") end, desc = "Previous hunk" },
        { "<leader>gp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
        { "<leader>gs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
        { "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
        { "<leader>gr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
        { "<leader>gb", function() require("gitsigns").blame_line() end, desc = "Blame line" },
    },
}
