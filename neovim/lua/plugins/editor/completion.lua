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
            kind_icons = {
                Text = 'TX', Method = 'FN', Function = 'FN', Constructor = 'FN',
                Field = 'FD', Variable = 'VR', Class = 'CL', Interface = 'IF',
                Module = 'MD', Property = 'FD', Unit = 'UT', Value = 'VL',
                Enum = 'EN', Keyword = 'KW', Snippet = 'SP', Color = 'CL',
                File = 'FL', Reference = 'RF', Folder = 'DR', EnumMember = 'EM',
                Constant = 'CT', Struct = 'ST', Event = 'EV', Operator = 'OP',
                TypeParameter = 'TP',
            },
        },
        completion = {
            documentation = { auto_show = true, treesitter_highlighting = true },
            menu = { draw = { treesitter = { 'lsp' } } },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                lsp = {
                    transform_items = function(_, items)
                        return vim.tbl_filter(function(item)
                            local client = vim.lsp.get_client_by_id(item.client_id)
                            return not client or client.name ~= "tabby"
                        end, items)
                    end,
                },
            },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            sorts = { 'score', 'sort_text', 'label' },
        },
    },
    opts_extend = { "sources.default" },
}
