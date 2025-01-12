require("mason").setup({
    ui = {
        icons = {
            package_installed = "I",
            package_pending = "P",
            package_uninstalled = "X"
        }
    }
})

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "clangd" },
    -- automatic_installation = {
    --     exclude = {
    --         "rust_analyzer"
    --     }
    -- },
    automatic_installation = true,
    handlders = {
        function(server_name)
            require("lspconfig")[server_name].setup {}
        end,
        -- ["clangd"] = function ()
            
        -- end,
    }
}