local M = {}

local function apply()
    local hi = vim.api.nvim_set_hl

    hi(0, "LineNr", { bg = "none" })
    hi(0, "CursorLineNr", { bg = "none", bold = true })
    hi(0, "SignColumn", { bg = "none" })
    hi(0, "FoldColumn", { bg = "none" })

    hi(0, "NormalDark", { bg = "none" })
    hi(0, "LazyNormal", { bg = "none" })
    hi(0, "MasonNormal", { bg = "none" })
    hi(0, "NeoTreeNormal", { bg = "none" })

    hi(0, "WinSeparator", { bg = "none" })
    hi(0, "MsgArea", { link = "Normal" })
end

function M.setup()
    vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("UserHighlights", { clear = true }),
        callback = apply,
    })
end

return M
