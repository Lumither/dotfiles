return {
    'Lumither/vim-tabby',
    lazy = false,
    init = function()
        vim.g.tabby_inline_completion_trigger = 'auto'
        vim.g.tabby_inline_completion_keybinding_accept = '<M-CR>'
        vim.g.tabby_inline_completion_keybinding_trigger_or_dismiss = '<M-\\>'
    end,
}
