return {
    servers = {
        rust = { "rust_analyzer" },
    },
    formatters = {
        rust = { "rustfmt" },
    },
    lsp_config = {
        rust_analyzer = {
            settings = {
                ["rust-analyzer"] = {
                    check = {
                        command = "clippy",
                    },
                },
            },
        },
    },
}
