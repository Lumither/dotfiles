return {
    'saghen/blink.cmp',
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'super-tab',
        },
        signature = {
            enabled = true,
        },
        appearance = {
            nerd_font_variant = 'mono',
        },
        completion = {
            documentation = { auto_show = true },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            sorts = { 'score', 'sort_text', 'label' },
        },
    },
    opts_extend = { "sources.default" },
}
