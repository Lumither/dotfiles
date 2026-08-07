return {
    "mrcjkb/rustaceanvim",
    version = "^6",
    ft = { "rust" },
    dependencies = { "williamboman/mason.nvim" },
    init = function()
        vim.g.rustaceanvim = {
            server = {
                default_settings = {
                    ["rust-analyzer"] = {
                        check = { command = "clippy" },
                        files = { watcher = "server" },
                        inlayHints = {
                            typeHints              = { enable = true },
                            parameterHints         = { enable = true },
                            chainingHints          = { enable = true },
                            closureReturnTypeHints = { enable = "always" },
                        },
                    },
                },
            },
        }
    end,
    config = function()
        local registry = require("mason-registry")
        registry.refresh(function()
            vim.schedule(function()
                local ok, pkg = pcall(registry.get_package, "rust-analyzer")
                if ok and not pkg:is_installed() and not pkg:is_installing() then
                    vim.notify("Mason: installing rust-analyzer", vim.log.levels.INFO)
                    pkg:install():once("closed", vim.schedule_wrap(function()
                        if pkg:is_installed() then
                            vim.notify("Mason: rust-analyzer installed", vim.log.levels.INFO)
                        else
                            vim.notify("Mason: rust-analyzer failed to install", vim.log.levels.ERROR)
                        end
                    end))
                end
            end)
        end)
    end,
}
