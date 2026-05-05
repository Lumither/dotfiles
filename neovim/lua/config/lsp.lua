local lang = require("config.lang")
local ft_servers = lang.ft_servers
local server_configs = lang.server_configs
local formatters_by_ft = lang.formatters_by_ft

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
    automatic_enable = false,
})

local function enable_server(server_name)
    local config = server_configs[server_name] or {}
    vim.lsp.config(server_name, config)
    vim.lsp.enable(server_name)
end

vim.api.nvim_create_user_command("LspRestart", function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local names = {}
    for _, c in ipairs(clients) do
        names[#names + 1] = c.name
        c:stop(false)
    end
    vim.defer_fn(function()
        for _, name in ipairs(names) do
            vim.lsp.enable(name)
        end
        vim.cmd.edit()
    end, 500)
end, { desc = "Restart LSP clients for current buffer" })

local skip_servers = { rust_analyzer = true }

for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
    if not skip_servers[server] then
        enable_server(server)
    end
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
        if pkg_ok and not pkg:is_installed() and not pkg:is_installing() then
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

local function install_formatters(ft, formatters)
    local registry = require("mason-registry")

    for _, fmt in ipairs(formatters) do
        if vim.fn.executable(fmt) == 1 then
            goto continue
        end

        local pkg_name = string.gsub(fmt, "_", "-")
        local pkg_ok, pkg = pcall(registry.get_package, pkg_name)
        if pkg_ok and not pkg:is_installed() and not pkg:is_installing() then
            vim.notify("Mason: installing " .. pkg_name .. " for " .. ft, vim.log.levels.INFO)
            pkg:install():once("closed", vim.schedule_wrap(function()
                if pkg:is_installed() then
                    vim.notify("Mason: " .. pkg_name .. " installed", vim.log.levels.INFO)
                else
                    vim.notify("Mason: " .. pkg_name .. " failed to install", vim.log.levels.ERROR)
                end
            end))
        end

        ::continue::
    end
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspBehavior", { clear = true }),
    callback = function(ev)
        if vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("MasonAutoInstall", { clear = true }),
    callback = function(ev)
        local ft = ev.match

        if installed_cache[ft] then
            return
        end
        installed_cache[ft] = true

        local registry = require("mason-registry")
        registry.refresh(function()
            vim.schedule(function()
                local servers = ft_servers[ft]
                if servers then
                    install_servers(ft, servers)
                end

                local formatters = formatters_by_ft[ft]
                if formatters then
                    install_formatters(ft, formatters)
                end
            end)
        end)
    end,
})
