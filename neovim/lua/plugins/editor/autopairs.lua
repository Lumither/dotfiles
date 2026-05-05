return {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {},
    config = function(_, opts)
        local pairs = require("mini.pairs")
        pairs.setup(opts)
        -- rust lifetime
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "rust",
            callback = function()
                pairs.map_buf(0, "i", "'", {
                    action = "open",
                    pair = "''",
                    neigh_pattern = "[^%a%s&<,\\][^%w]",
                })
            end,
        })
    end,
}
