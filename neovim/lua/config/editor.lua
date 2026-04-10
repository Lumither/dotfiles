vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.timeoutlen = 500

if not vim.g.vscode then
    vim.wo.number = true
    vim.wo.relativenumber = true
    vim.wo.cursorline = true
    vim.wo.signcolumn = "yes"

    vim.o.autoread = true
    vim.wo.wrap = false

    vim.o.mouse = "a"

    vim.o.list = true
    vim.o.listchars = "space:·,tab:> "

    vim.opt.termguicolors = true
    vim.o.splitbelow = true
    vim.o.splitright = true
    vim.o.updatetime = 200
    vim.o.showmode = false
    vim.o.backup = false
    vim.o.writebackup = false
    vim.o.swapfile = false

    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
    vim.api.nvim_create_autocmd("TermOpen", {
        callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.sidescrolloff = 0
            vim.keymap.set("t", "<ScrollWheelLeft>", "<Nop>", { buffer = 0, silent = true })
            vim.keymap.set("t", "<ScrollWheelRight>", "<Nop>", { buffer = 0, silent = true })
        end,
    })

    vim.api.nvim_create_autocmd("BufReadPost", {
        callback = function()
            local mark = vim.api.nvim_buf_get_mark(0, '"')
            if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
                pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
        end,
    })
end
