return {
    {
        url = "https://codeberg.org/andyg/leap.nvim",
        dependencies = {
            "tpope/vim-repeat",
        },
        config = function()
            vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
            vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
            vim.keymap.set({ "n", "x", "o" }, "<Leader>j", "<Plug>(leap-from-window)", { desc = "Leap cross-window" })
        end,
    },
}
