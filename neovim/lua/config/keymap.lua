local map = vim.keymap.set

map({ "n", "v" }, "U", "<C-r>", { desc = "Redo" })

map({ "n", "v" }, "H", "^", { desc = "Line start" })
map({ "n", "v" }, "L", "$", { desc = "Line end" })

map({ "n", "v" }, "J", "3j", { desc = "Move down 3 lines" })
map({ "n", "v" }, "K", "3k", { desc = "Move up 3 lines" })

for i = 1, 9 do
    map("n", "<C-w>" .. i, i .. "<C-w>w", { desc = "Go to window " .. i })
end

map("n", "yy", '"+yy', { desc = "Yank line to clipboard" })
map("v", "y", '"+y', { desc = "Yank selection to clipboard" })
map("n", "p", '"+p', { desc = "Paste from clipboard after" })
map("v", "p", '"+p', { desc = "Paste from clipboard after" })
map("n", "P", '"+P', { desc = "Paste from clipboard before" })
map("v", "P", '"+P', { desc = "Paste from clipboard before" })

map("n", "<leader>yy", "yy", { desc = "Yank line (internal)" })
map("v", "<leader>y", "y", { desc = "Yank selection (internal)" })
map("n", "<leader>p", "p", { desc = "Paste after (internal)" })
map("v", "<leader>p", "p", { desc = "Paste after (internal)" })
map("n", "<leader>P", "P", { desc = "Paste before (internal)" })
map("v", "<leader>P", "P", { desc = "Paste before (internal)" })

if vim.g.vscode then
    local vscode = require("vscode")
    local call = vscode.call

    map("n", "<leader>sf", function() call("workbench.action.quickOpen") end, { desc = "Find files" })
    map("n", "<leader><leader>", function() call("workbench.action.findInFiles") end, { desc = "Search everywhere" })
    map("n", "<leader>sb", function() call("workbench.action.showAllEditors") end, { desc = "Buffers" })
    map("n", "<leader>sr", function() call("workbench.action.openRecent") end, { desc = "Recent files" })
    map("n", "<leader>/", function() call("workbench.action.showCommands") end, { desc = "Command palette" })

    map("n", "<leader>f", function() call("revealInExplorer") end, { desc = "Reveal file in tree" })
    map("n", "<leader>t", function() call("workbench.action.toggleSidebarVisibility") end, { desc = "Toggle sidebar" })

    map("n", "<C-w>s", function() call("workbench.action.splitEditor") end, { desc = "Vertical split" })
    map("n", "<C-w>S", function() call("workbench.action.splitEditorOrthogonal") end, { desc = "Horizontal split" })

    map("n", "]b", function() call("workbench.action.nextEditor") end, { desc = "Next editor" })
    map("n", "[b", function() call("workbench.action.previousEditor") end, { desc = "Previous editor" })
    map("n", "<leader>x", function() call("workbench.action.closeActiveEditor") end, { desc = "Close editor" })

    map("n", "gd", function() call("editor.action.revealDefinition") end, { desc = "Go to definition" })
    map("n", "gr", function() call("editor.action.goToReferences") end, { desc = "References" })
    map("n", "<leader>D", function() call("editor.action.goToImplementation") end, { desc = "Implementation" })
    map("n", "<leader>d", function() call("editor.action.showHover") end, { desc = "Hover docs" })
    map("n", "<leader>rn", function() call("editor.action.rename") end, { desc = "Rename symbol" })
    map("n", "<leader>ca", function() call("editor.action.quickFix") end, { desc = "Code action" })
    map({ "n", "v" }, "<A-CR>", function() call("editor.action.quickFix") end, { desc = "Code action" })
    map("n", "gs", function() call("outline.focus") end, { desc = "Document symbols" })
    map("n", "gS", function() call("workbench.action.gotoSymbol") end, { desc = "Document symbols (picker)" })

    map("n", "<leader>e", function() call("editor.action.showHover") end, { desc = "Show diagnostic" })
    map("n", "<leader>E", function() call("workbench.actions.view.problems") end, { desc = "Problems panel" })
    map("n", "]e", function() call("editor.action.marker.next") end, { desc = "Next diagnostic" })
    map("n", "[e", function() call("editor.action.marker.prev") end, { desc = "Previous diagnostic" })

    map("n", "]h", function() call("workbench.action.editor.nextChange") end, { desc = "Next change" })
    map("n", "[h", function() call("workbench.action.editor.previousChange") end, { desc = "Previous change" })
    map("n", "<leader>gp", function() call("editor.action.dirtydiff.next") end, { desc = "Preview change" })
    map("n", "<leader>gr", function() call("git.revertSelectedRanges") end, { desc = "Revert change" })

    map("n", "<leader>F", function() call("editor.action.formatDocument") end, { desc = "Format document" })

    map("n", "<C-`>", function() call("workbench.action.terminal.toggleTerminal") end, { desc = "Toggle terminal" })
else
    map("n", "<S-Esc>", function()
        local closed = false
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            local ft = vim.bo[buf].filetype
            if ft == "neo-tree" or ft == "trouble" or ft == "toggleterm" then
                vim.api.nvim_win_close(win, true)
                closed = true
            end
        end
        if not closed then
            vim.cmd("only")
        end
    end, { desc = "Close side panels" })

    map("n", "<C-w>s", "<cmd>vsplit<cr>", { desc = "Vertical split" })
    map("n", "<C-w>S", "<cmd>split<cr>", { desc = "Horizontal split" })

    map("n", "<leader>f", "<cmd>Neotree reveal<cr>", { desc = "Reveal file in tree" })
    map("n", "<leader>t", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
        callback = function(ev)
            local opts = { buffer = ev.buf }

            map("n", "gd", function() require("telescope.builtin").lsp_definitions() end, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
            map("n", "gr", function() require("telescope.builtin").lsp_references() end, vim.tbl_extend("force", opts, { desc = "References" }))
            map("n", "<leader>D", function() require("telescope.builtin").lsp_implementations() end, vim.tbl_extend("force", opts, { desc = "Implementation" }))
            map("n", "<leader>d", function() vim.lsp.buf.hover() end, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
            map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
            map({ "n", "v" }, "<leader>ca", function() require("actions-preview").code_actions() end, vim.tbl_extend("force", opts, { desc = "Code action (preview)" }))
            map("n", "gs", function() require("trouble").toggle("symbols") end, { desc = "Document symbols" })
            map("n", "gS", function() require("telescope.builtin").lsp_document_symbols() end, vim.tbl_extend("force", opts, { desc = "Document symbols" }))
        end,
    })
end
