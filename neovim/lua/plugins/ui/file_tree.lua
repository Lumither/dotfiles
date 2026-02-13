return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "echasnovski/mini.icons",
        },
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,
                },
            },
            window = {
                width = 35,
                auto_expand_width = true,
            },
            renderers = {
                directory = {
                    { "indent" },
                    { "icon" },
                    { "current_filter" },
                    { "container", content = {
                        { "name", zindex = 10 },
                        { "diagnostics", zindex = 20, align = "right" },
                        { "git_status", zindex = 20, align = "right" },
                    }},
                },
                file = {
                    { "indent" },
                    { "icon" },
                    { "container", content = {
                        { "name", zindex = 10 },
                        { "bufnr", zindex = 10 },
                        { "modified", zindex = 20, align = "right" },
                        { "diagnostics", zindex = 20, align = "right" },
                        { "git_status", zindex = 20, align = "right" },
                    }},
                },
            },
            default_component_configs = {
                container = {
                    enable_character_fade = true,
                },
                name = {
                    trailing_slash = false,
                    use_git_status_colors = true,
                },
                modified = {
                    symbol = "[+]",
                },
                icon = {
                    folder_closed = "+",
                    folder_open = "-",
                    folder_empty = "0",
                },
                diagnostics = {
                    symbols = {
                        error = "E",
                        warn = "W",
                        hint = "H",
                        info = "I",
                    },
                },
                git_status = {
                    symbols = {
                        added = "+",
                        modified = "~",
                        deleted = "-",
                        renamed = ">",
                        untracked = "?",
                        ignored = ".",
                        unstaged = "*",
                        staged = "+",
                        conflict = "!",
                    },
                },
            },
        },
    },
}
