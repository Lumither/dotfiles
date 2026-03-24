return {
    servers = {
        javascript = { "vtsls", "eslint", "tailwindcss" },
        javascriptreact = { "vtsls", "eslint", "tailwindcss" },
        typescript = { "vtsls", "eslint", "tailwindcss" },
        typescriptreact = { "vtsls", "eslint", "tailwindcss" },
        json = { "jsonls" },
        astro = { "astro", "tailwindcss" },
        css = { "cssls", "tailwindcss" },
        scss = { "cssls", "tailwindcss" },
        less = { "cssls", "tailwindcss" },
        html = { "html", "tailwindcss" },
        svelte = { "svelte", "tailwindcss" },
        vue = { "volar", "tailwindcss" },
        graphql = { "graphql" },
        prisma = { "prismals" },
    },
    lsp_config = {
        cssls = {
            settings = {
                css = { lint = { unknownAtRules = "ignore" } },
                scss = { lint = { unknownAtRules = "ignore" } },
                less = { lint = { unknownAtRules = "ignore" } },
            },
        },
    },
    formatters = {
        javascript = { "biome" },
        typescript = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
    },
}
