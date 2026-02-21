return {
    "mfussenegger/nvim-lint",
    event = "BufReadPre",
    config = function()
        require("lint").linters_by_ft = {
            markdown = { "markdownlint" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
