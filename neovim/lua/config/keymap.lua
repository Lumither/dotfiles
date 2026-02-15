local map = vim.keymap.set

-- Redo
map({ "n", "v" }, "U", "<C-r>", { desc = "Redo" })

-- Line navigation
map({ "n", "v" }, "H", "^", { desc = "Line start" })
map({ "n", "v" }, "L", "$", { desc = "Line end" })

-- Fast vertical movement
map({ "n", "v" }, "J", "3j", { desc = "Move down 3 lines" })
map({ "n", "v" }, "K", "3k", { desc = "Move up 3 lines" })

-- System clipboard yank/paste (default)
map("n", "yy", '"+yy', { desc = "Yank line to clipboard" })
map("v", "y", '"+y', { desc = "Yank selection to clipboard" })
map("n", "p", '"+p', { desc = "Paste from clipboard after" })
map("v", "p", '"+p', { desc = "Paste from clipboard after" })
map("n", "P", '"+P', { desc = "Paste from clipboard before" })
map("v", "P", '"+P', { desc = "Paste from clipboard before" })

-- Internal register (via leader)
map("n", "<leader>yy", "yy", { desc = "Yank line (internal)" })
map("v", "<leader>y", "y", { desc = "Yank selection (internal)" })
map("n", "<leader>p", "p", { desc = "Paste after (internal)" })
map("v", "<leader>p", "p", { desc = "Paste after (internal)" })
map("n", "<leader>P", "P", { desc = "Paste before (internal)" })
map("v", "<leader>P", "P", { desc = "Paste before (internal)" })

-- Splits (swap defaults: s=vertical, S=horizontal)
map("n", "<C-w>s", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<C-w>S", "<cmd>split<cr>", { desc = "Horizontal split" })

-- File tree (matches IdeaVim SelectInProjectView)
map("n", "<leader>f", "<cmd>Neotree reveal<cr>", { desc = "Reveal file in tree" })
map("n", "<leader>t", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })


-- LSP keybindings (only active when LSP is attached)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        map("n", "gd", function() require("telescope.builtin").lsp_definitions() end, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
        map("n", "gr", function() require("telescope.builtin").lsp_references() end, vim.tbl_extend("force", opts, { desc = "References" }))
        map("n", "<leader>D", function() require("telescope.builtin").lsp_implementations() end, vim.tbl_extend("force", opts, { desc = "Implementation" }))
        map("n", "<leader>d", function() vim.lsp.buf.hover() end, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
        map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
        map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
        map("n", "gs", function() require("trouble").toggle("symbols") end, { desc = "Document symbols" })
        map("n", "gS", function() require("telescope.builtin").lsp_document_symbols() end, vim.tbl_extend("force", opts, { desc = "Document symbols" }))
    end,
})
