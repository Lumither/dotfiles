local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo,
        lazypath
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" },
            { "\nPress any key to exit..." }
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local spec = {
    { import = "plugins.editor.surround" },
    { import = "plugins.editor.jump" },
    { import = "plugins.editor.which_key" },
}

if not vim.g.vscode then
    vim.list_extend(spec, {
        { import = "plugins.ui" },
        { import = "plugins.editor" },
        { import = "plugins.lsp" },
    })
end

require("lazy").setup({
    spec = spec,
    checker = { enabled = not vim.g.vscode },
})
