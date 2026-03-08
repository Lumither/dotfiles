return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
        theme = "wave",
        overrides = function(colors)
            local palette = colors.palette
            local bg = palette.sumiInk2
            local border = palette.sumiInk4
            local fg = palette.fujiWhite
            local accent = palette.springBlue
            local accent2 = palette.springViolet1
            local sel_bg = accent
            local sel_fg = palette.sumiInk0

            return {
                Visual = { bg = palette.waveBlue2 },
                CursorLine = { bg = palette.sumiInk3 },

                NormalFloat = { fg = fg, bg = bg },
                FloatBorder = { fg = border, bg = bg },
                FloatTitle = { fg = accent2, bg = bg, bold = true },

                DiagnosticSignError = { fg = palette.peachRed, bg = "none" },
                DiagnosticSignWarn = { fg = palette.carpYellow, bg = "none" },
                DiagnosticSignHint = { fg = palette.waveAqua1, bg = "none" },
                DiagnosticSignInfo = { fg = palette.springBlue, bg = "none" },

                NeoTreeDiagnosticSignError = { fg = palette.peachRed, bg = "none" },
                NeoTreeDiagnosticSignWarn = { fg = palette.carpYellow, bg = "none" },
                NeoTreeDiagnosticSignHint = { fg = palette.waveAqua1, bg = "none" },
                NeoTreeDiagnosticSignInfo = { fg = palette.springBlue, bg = "none" },

                NeoTreeGitAdded = { fg = palette.springGreen },
                NeoTreeGitModified = { fg = palette.carpYellow },
                NeoTreeGitDeleted = { fg = palette.peachRed },
                NeoTreeGitRenamed = { fg = palette.springBlue },
                NeoTreeGitUntracked = { fg = fg },
                NeoTreeGitIgnored = { fg = palette.fujiGray },
                NeoTreeDotfile = { fg = fg },
                NeoTreeHiddenByName = { fg = fg },
                NeoTreeGitUnstaged = { fg = palette.carpYellow },
                NeoTreeGitStaged = { fg = palette.springGreen },
                NeoTreeGitConflict = { fg = palette.peachRed, bold = true },

                NeoTreeFileName = { fg = fg },
                NeoTreeTitleBar = { fg = fg, bg = bg, bold = true },

                NuiInput = { fg = fg, bg = bg },
                NuiBorder = { fg = border, bg = bg },
                NuiTitle = { fg = accent2, bg = bg, bold = true },

                Pmenu = { fg = fg, bg = bg },
                PmenuSel = { fg = sel_fg, bg = sel_bg, bold = true },
                PmenuSbar = { bg = palette.sumiInk3 },
                PmenuThumb = { bg = accent2 },

                BlinkCmpMenu = { fg = fg, bg = bg },
                BlinkCmpMenuSelection = { fg = sel_fg, bg = sel_bg, bold = true },
                BlinkCmpMenuBorder = { fg = border, bg = bg },
                BlinkCmpLabel = { fg = fg },
                BlinkCmpLabelMatch = { fg = accent, bold = true },
                BlinkCmpKind = { fg = accent2 },
                BlinkCmpDoc = { fg = fg, bg = bg },
                BlinkCmpDocBorder = { fg = border, bg = bg },

                WinSeparator = { fg = palette.sumiInk4, bg = "none" },

                WhichKeyNormal = { fg = fg, bg = "none" },
                WhichKeyBorder = { fg = border, bg = "none" },
                WhichKeyTitle = { fg = accent2, bg = "none", bold = true },

                GitSignsAddNr = { fg = "none", bg = palette.autumnGreen },
                GitSignsChangeNr = { fg = "none", bg = palette.autumnYellow },
                GitSignsDeleteNr = { fg = "none", bg = palette.autumnRed },
                GitSignsTopdeleteNr = { fg = "none", bg = palette.autumnRed },
                GitSignsChangedeleteNr = { fg = "none", bg = palette.autumnYellow },
                GitSignsUntrackedNr = { fg = "none", bg = palette.sumiInk4 },
            }
        end,
    },
}
