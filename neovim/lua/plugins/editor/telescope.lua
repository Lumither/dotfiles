return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            defaults = {
                file_ignore_patterns = { "%.git/", "node_modules/", "dist/", "build/" },
            },
        },
        keys = {
            { "<leader>sf",            function() require("telescope.builtin").find_files() end, desc = "Find files" },
            { "<leader>/",        function() require("telescope.builtin").builtin() end,    desc = "All pickers" },
            { "<leader>sb",       function() require("telescope.builtin").buffers() end,    desc = "Buffers" },
            { "<leader>sh",       function() require("telescope.builtin").help_tags() end,  desc = "Help tags" },
            { "<leader>sr",       function() require("telescope.builtin").oldfiles() end,   desc = "Recent files" },
            { "<leader><leader>", function() require("telescope.builtin").live_grep() end,  desc = "Search everywhere" },
        },
    },
}
