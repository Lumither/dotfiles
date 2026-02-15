return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "kkharji/sqlite.lua",
            { "Lumither/smart-open.nvim", branch = "main" },
        },
        config = function()
            local telescope = require("telescope")
            local external_sources = require("config.external_sources")
            telescope.setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg", "--color=never", "--no-heading", "--with-filename",
                        "--line-number", "--column", "--smart-case",
                        "--hidden", "--glob", "!.git/",
                    },
                    file_ignore_patterns = { "%.git/", "node_modules/", "dist/", "build/" },
                },
                extensions = {
                    smart_open = {
                        match_algorithm = "fzf",
                        result_limit = 5000,
                        ignore_patterns = external_sources,
                    },
                },
            })
            telescope.load_extension("fzf")
            telescope.load_extension("smart_open")

        end,
        keys = {
            { "<leader>sf", function() require("telescope").extensions.smart_open.smart_open({ cwd_only = true }) end, desc = "Find files" },
            { "<leader>sF", function() require("telescope").extensions.smart_open.smart_open({ cwd_only = true, ignore_patterns = {} }) end, desc = "Find files (include deps)" },
            { "<leader>/",        function() require("telescope.builtin").builtin() end,    desc = "All pickers" },
            { "<leader>sb",       function() require("telescope.builtin").buffers() end,    desc = "Buffers" },
            { "<leader>sh",       function() require("telescope.builtin").help_tags() end,  desc = "Help tags" },
            { "<leader>sr",       function() require("telescope.builtin").oldfiles() end,   desc = "Recent files" },
            { "<leader><leader>", function() require("telescope.builtin").live_grep() end,  desc = "Search everywhere" },
        },
    },
}
