vim.diagnostic.config(
    {
        underline = true,
        virtual_text = {
            spacing = 2,
        },
        update_in_insert = true,
        severity_sort = true,
        signs = {
            text = {
                -- Alas nerdfont icons don't render properly on Medium!
                [vim.diagnostic.severity.ERROR] = "E",
                [vim.diagnostic.severity.WARN] = "W ",
                [vim.diagnostic.severity.HINT] = "H ",
                [vim.diagnostic.severity.INFO] = "I ",
            },
        },
    }
)

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
                -- require("trouble").toggle("diagnostics", { focus = true, filter = { buf = 0 } })
                vim.lsp.buf.hover()
            end,
            desc = "Buffer Diagnostics (Trouble, Focused)"
        },
        -- {
        --     "<leader>e",
        --     function()
        --         local trouble = require("trouble")
        --         local bufnr = vim.api.nvim_get_current_buf()
        --         local cursor = vim.api.nvim_win_get_cursor(0)
        --         local line = cursor[1] - 1
        --
        --         local all_diags = vim.diagnostic.get(bufnr)
        --         local line_diags = {}
        --         for _, d in ipairs(all_diags) do
        --             if d.lnum == line then
        --                 table.insert(line_diags, d)
        --             end
        --         end
        --
        --         if #line_diags == 0 then
        --             vim.notify("Diagnostics DNE", vim.log.levels.INFO)
        --             -- require("trouble").toggle("diagnostics", { focus = true, filter = { buf = 0 } })
        --             return
        --         end
        --
        --         trouble.toggle("diagnostics", {
        --             focus = true,
        --             filter = function(item)
        --                 return item.lnum == line
        --             end,
        --         })
        --     end,
        --     desc = "Diagnostics under cursor (Trouble, Focused)",
        -- }, -- },
        --
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
