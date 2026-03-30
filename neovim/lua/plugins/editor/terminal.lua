return {
    "akinsho/toggleterm.nvim",
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = "<C-`>",
        direction = "horizontal",
        shade_terminals = false,
    },
    keys = {
        { "<C-`>", "<cmd>ToggleTerm<cr>", mode = "t", desc = "Toggle terminal" },
        { "<S-Esc>", "<cmd>ToggleTerm<cr>", mode = "t", desc = "Close terminal" },
    },
}
