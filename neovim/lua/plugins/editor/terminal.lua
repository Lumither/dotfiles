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
        persist_size = false,
        on_open = function(term)
            vim.keymap.set("t", "<S-Esc>", "<cmd>ToggleTerm<cr>", { buffer = term.bufnr, desc = "Close terminal" })
        end,
    },
    keys = {
        { "<C-`>", desc = "Toggle terminal" },
        { "<C-`>", "<cmd>ToggleTerm<cr>", mode = "t", desc = "Toggle terminal" },
    },
}
