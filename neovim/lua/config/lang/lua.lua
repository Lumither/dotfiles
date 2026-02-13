return {
    servers = {
        lua = { "lua_ls" },
    },
    formatters = {
        lua = { "stylua" },
    },
    lsp_config = {
        lua_ls = {
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = { vim.env.VIMRUNTIME },
                        checkThirdParty = false,
                    },
                },
            },
        },
    },
}
