return {
    'Lumither/vim-tabby',
    lazy = false,
    init = function()
        vim.g.tabby_agent_start_command = {
            'env',
            'NODE_OPTIONS=--require=' .. vim.fn.stdpath('config') .. '/tabby-agent-shim.js',
            'npx',
            'tabby-agent',
            '--stdio',
        }
        vim.g.tabby_inline_completion_trigger = 'auto'
        vim.g.tabby_inline_completion_keybinding_accept = '<S-CR>'
        vim.g.tabby_inline_completion_keybinding_trigger_or_dismiss = '<M-\\>'
    end,
}
