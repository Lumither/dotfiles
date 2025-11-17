return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- config = function()
    --     require("mason").setup({
    --         ui = {
    --             icons = {
    --                 package_installed = "I",
    --                 package_pending = "P",
    --                 package_uninstalled = "X"
    --             }
    --         }
    --     })
    --
    --     require("mason-lspconfig").setup({
    --         automatic_installation = false,
    --         handlers = {
    --             function(server_name)
    --                 require("lspconfig")[server_name].setup {}
    --             end,
    --             -- ["clangd"] = function ()
    --             -- end,
    --         }
    --     })
    -- end
}
