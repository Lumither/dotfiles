local lang = require("config.lang")
local ft_servers = lang.ft_servers
local server_configs = lang.server_configs

vim.diagnostic.config({
    underline = true,
    virtual_text = { spacing = 2 },
    update_in_insert = true,
    severity_sort = true,
    float = { border = "rounded" },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.HINT] = "H",
            [vim.diagnostic.severity.INFO] = "I",
        },
    },
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "I",
            package_pending = "P",
            package_uninstalled = "X",
        },
    },
})

require("mason-lspconfig").setup({
    automatic_installation = false,
})

local function enable_server(server_name)
    local config = server_configs[server_name] or {}
    vim.lsp.config(server_name, config)
    vim.lsp.enable(server_name)
end

for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
    enable_server(server)
end

local installed_cache = {}

local function install_servers(ft, servers)
    local registry = require("mason-registry")
    local mason_lspconfig = require("mason-lspconfig")

    for _, server in ipairs(servers) do
        if vim.fn.executable(server) == 1 then
            enable_server(server)
            goto continue
        end

        local ok, mapping = pcall(function()
            return mason_lspconfig.get_mappings().lspconfig_to_package[server]
        end)
        local pkg_name = (ok and mapping) or server

        local pkg_ok, pkg = pcall(registry.get_package, pkg_name)
        if pkg_ok and not pkg:is_installed() then
            vim.notify("Mason: installing " .. pkg_name .. " for " .. ft, vim.log.levels.INFO)
            pkg:install():once("closed", vim.schedule_wrap(function()
                if pkg:is_installed() then
                    vim.notify("Mason: " .. pkg_name .. " installed", vim.log.levels.INFO)
                    enable_server(server)
                else
                    vim.notify("Mason: " .. pkg_name .. " failed to install", vim.log.levels.ERROR)
                end
            end))
        elseif not pkg_ok then
            enable_server(server)
        end

        ::continue::
    end
end

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("MasonAutoInstall", { clear = true }),
    callback = function(ev)
        local ft = ev.match
        local servers = ft_servers[ft]
        if not servers then
            return
        end

        if installed_cache[ft] then
            return
        end
        installed_cache[ft] = true

        local registry = require("mason-registry")
        registry.refresh(function()
            vim.schedule(function()
                install_servers(ft, servers)
            end)
        end)
    end,
})
