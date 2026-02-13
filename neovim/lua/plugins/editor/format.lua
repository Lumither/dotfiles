return {
    'stevearc/conform.nvim',
    config = function()
        require("conform").setup({
            formatters_by_ft = require("config.lang").formatters_by_ft,
        })

        vim.keymap.set("n", "<leader>F", function()
            require("conform").format({
                lsp_fallback = true,
                async = true,
                timeout_ms = 3000,
            })
        end, { desc = "Format current buffer" })
    end,
}
