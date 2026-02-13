return {
    {
        url = "https://codeberg.org/andyg/leap.nvim",
        dependencies = {
            "tpope/vim-repeat",
        },
        config = function()
            local leap = require("leap")
            leap.add_default_mappings()

            vim.keymap.set("n", "<Leader>j", "<Plug>(leap-forward)", {})
            vim.keymap.set("n", "<Leader>l", "<Plug>(leap-line-forward)", {})
            vim.keymap.set("n", "<Leader>w", "<Plug>(leap-cross-window)", {})
        end,
    },
}
