local modules = {
    "config.lang.lua",
    "config.lang.python",
    "config.lang.go",
    "config.lang.web",
    "config.lang.rust",
    "config.lang.shell",
    "config.lang.c",
    "config.lang.ocaml",
    "config.lang.swift",
    "config.lang._default",
}

local ft_servers = {}
local server_configs = {}
local formatters_by_ft = {}

for _, mod in ipairs(modules) do
    local lang = require(mod)
    if lang.servers then
        for ft, servers in pairs(lang.servers) do
            ft_servers[ft] = servers
        end
    end
    if lang.formatters then
        for ft, fmts in pairs(lang.formatters) do
            formatters_by_ft[ft] = fmts
        end
    end
    if lang.lsp_config then
        for server, config in pairs(lang.lsp_config) do
            server_configs[server] = config
        end
    end
end

return {
    ft_servers = ft_servers,
    server_configs = server_configs,
    formatters_by_ft = formatters_by_ft,
}
