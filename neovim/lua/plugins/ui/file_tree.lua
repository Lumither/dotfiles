return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "echasnovski/mini.icons",
        },
        opts = {
            view = {
                -- float = {
                --     enable = true,
                --     open_win_config = {
                --         relative = "editor",
                --         border = "rounded",
                --         width = 40,
                --         height = 30,
                --         row = 1,
                --         col = 1,
                --     },
                -- },
                width = 35,
                side = "right",
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            renderer = {
                full_name = true,
                highlight_git = "name",
                icons = {
                    modified_placement = "right_align",
                    git_placement = "right_align",
                    diagnostics_placement = "right_align",
                    glyphs = {
                        folder = {
                            default = " +",
                            open = " -",
                            empty = " 0",
                            empty_open = " 0",
                            arrow_closed = "",
                            arrow_open = "",
                            symlink = " ~",
                        },
                        modified = "[+]",
                        git = {
                            unstaged = "*",
                            staged = "+",
                            unmerged = "!",
                            renamed = ">",
                            untracked = "?",
                            deleted = "-",
                            ignored = ".",
                        },
                    },
                },
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
            diagnostics = {
                enable = true,
                icons = {
                    error = "E",
                    warning = "W",
                    hint = "H",
                    info = "I",
                },
            },
            modified = {
                enable = true,
                show_on_open_dirs = true,
            },
            git = {
                enable = true,
            },
        },
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    },
}
