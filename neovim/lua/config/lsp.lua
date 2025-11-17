local eagerly_installed_langs = { "diff", "Lua", "Vim", "Markdown", "markdown_inline" }

local ensure_installed = {
    ["*"] = { "typos_lsp" },
    Agda = { "agda_ls" },
    Angular = { "angularls" },
    Arduino = { "arduino_language_server" },
    Astro = { "astro", "stylelint_lsp", "tailwindcss" },
    AWK = { "awk_ls" },
    Bash = { "bashls", "shellcheck", "shfmt" },
    ["BUILD.Bazel"] = { "starlark_rust" }, -- Bazel
    bzl = { "starlark_rust" },             -- Bazel
    C = { "clangd", "clang-format" },
    Clojure = { "clojure_lsp", "zprint", "clj-kondo" },
    CMake = { "cmake" },
    CMakeCache = { "cmake" },
    COBOL = { "cobol_ls" },
    conf = { "autotools_ls" }, -- Autoconf
    ConTeXt = { "texlab" },
    Coq = { "coq_lsp" },
    Cpp = { "clangd", "clang-format" },
    Crystal = { "crystalline" },
    Cucumber = { "cucumber_language_server" },
    Cypher = { "cypher_ls" },
    csh = { "bashls", "shellcheck", "beautysh" },
    CS = { "ominisharp", "csharpier" }, -- C#
    CSS = { "cssls", "stylelint_lsp", "tailwindcss" },
    D = { "serve_d" },
    Dart = { "dartls" },
    Dhall = { "dhall_lsp_server", "purescriptls", "purescript-tidy" },
    Dockerfile = { "dockerls", "docker_compose_language_service" },
    Dot = { "dotls" },
    Elixir = { "lexical" },
    Elm = { "elmls", "elm-format" },
    Erlang = { "elp" },
    Erg = { "erg_language_server" },
    Fennel = { "fennel_ls" },
    Flux = { "flux_lsp" },
    Fortran = { "fortls" },
    FSharp = { "fsautocomplete" }, -- F#
    genie = { "vala_ls" },         -- Vala
    Go = { "gopls", "goimports", "golangci_lint_ls" },
    GraphQL = { "graphql" },
    Groovy = { "groovyls", "gralde_ls" },
    Hack = { "hhvm" },
    Haskell = { "hls", "ormolu", "hlint" },
    Haxe = { "haxe_language_server" },
    Helm = { "helm_ls" },
    Hoon = { "hoon_ls" },
    HTML = { "html", "angularls", "tailwindcss" },
    Hyprlang = { "hyprls" },
    Idris2 = { "idris2_lsp" },
    Java = { "jdtls", "checkstyle", "google-java-format" },
    JavaScript = { "vtsls", "prettierd", "eslint_d", "eslint", "stylelint_lsp", "tailwindcss" },
    JavaScriptReact = { "vtsls", "prettierd", "eslint_d", "eslint", "stylelint_lsp", "tailwindcss" },
    Jinja = { "jinja_lsp" },
    jq = { "jqls" },
    JSON = { "jsonls", "spectral" },
    Jsonnet = { "jsonnet_ls" },
    Julia = { "julials" },
    Kotlin = { "kotlin_language_server", "gradle_ls" },
    ksh = { "bashls", "shellcheck", "beautysh" },
    LaTeX = { "texlab" },
    libsonnet = { "jsonnet_ls" },
    Lean = { "leanls" },
    Lean3 = { "lean-language-server", "lean3ls" },
    Less = { "cssls", "stylelint_lsp", "tailwindcss" },
    Lua = { "lua_ls", "stylua" },
    Luau = { "luau_lsp", "stylua" },
    Make = { "autotools_ls" },
    Markdown = { "marksman" },
    ["Markdown.MDX"] = { "mdx_analyzer" },
    Matlab = { "matlab_ls" },
    Meson = { "mesonlsp" },
    mksh = { "bashls", "shellcheck", "shfmt" },
    Move = { "move_analyzer" },
    ncl = { "nickel_ls" }, -- Nickel
    Nginx = { "nginx_language_server" },
    Nickel = { "nickel_ls" },
    Nim = { "nim_langserver" },
    Ninja = { "autotools_ls" },
    Nix = { "nil_ls" },
    OCaml = { "ocamllsp", "ocamlformat" },
    p8 = { "pico8_ls" }, -- PICO-8
    Perl = { "perlnavigator", "raku_navigator" },
    pest = { "pest_ls" },
    PHP = { "phpactor", "psalm" },
    PlainTeX = { "texlab" },
    PowerShell = { "powershell_es" },
    Prisma = { "prismals" },
    Proto = { "pbls" }, -- Protobuf
    PureScript = { "purescriptls", "purescript-tidy" },
    Python = { "pyright", "ruff" },
    R = { "r_language_server" },
    Raku = { "raku_navigator" },
    Reason = { "reason_ls" },
    Rego = { "regal" },
    ReScript = { "rescriptls" },
    rst = { "esbonio" }, -- Sphinx
    Ruby = { "solargraph", "rubocop", "sorbet" },
    Rust = { "rust_analyzer" },
    Scala = { "metals" },
    SCSS = { "cssls", "stylelint_lsp", "tailwindcss" },
    sh = { "bashls", "shellcheck", "shfmt" },
    Slint = { "slint_lsp" },
    Smithy = { "smithy_ls" },
    SML = { "millet" },
    Solidity = { "solidity", "solang" },
    SQL = { "sqls" },
    star = { "starlark_rust" }, -- Bazel
    Svelte = { "svelte", "stylelint_lsp", "tailwindcss" },
    SystemVerilog = { "verible", "hdl_checker" },
    tcsh = { "bashls", "shellcheck", "beautysh" },
    Teal = { "teal_ls" },
    Terraform = { "terraformls", "tflint" },
    TeX = { "texlab" },
    Thrift = { "thriftls" },
    TOML = { "taplo" },
    TypeScript = { "vtsls", "prettierd", "eslint_d", "eslint", "angularls", "stylelint_lsp", "tailwindcss" },
    TypeScriptReact = { "vtsls", "prettierd", "eslint_d", "eslint", "stylelint_lsp", "tailwindcss" },
    Typst = { "typst_lsp" },
    V = { "v_analyzer" },
    Vala = { "vala_ls" },
    VB = { "ominisharp" },
    Verilog = { "verible", "hdl_checker" },
    Veryl = { "veryl_ls" },
    VHDL = { "vhdl_ls", "hdl_checker" },
    Vim = { "vimls" },
    Vlang = { "v_analyzer" },
    Vue = { "volar", "stylelint_lsp", "tailwindcss" },
    WGSL = { "wgsl_analyzer" },
    XML = { "lemminx" },
    YAML = { "yamlls", "spectral", "docker_compose_language_service", "azure_pipelines_ls" },
    YML = { "yamlls", "spectral", "docker_compose_language_service", "azure_pipelines_ls" },
    Zig = { "zls" },
    Zsh = { "bashls", "shellcheck", "beautysh" },
}


require("mason").setup({
    ui = {
        icons = {
            package_installed = "I",
            package_pending = "P",
            package_uninstalled = "X"
        }
    }
})

require("mason-lspconfig").setup({
    eagerly_installed_langs = eagerly_installed_langs,
    automatic_installation = false,
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup {}
        end,
        -- ["clangd"] = function ()
        -- end,
    }
})

-- local filetype_servers = {}
-- for filetype, tools in pairs(ensure_installed) do
--     if filetype ~= "*" then
--         filetype_servers[filetype:lower()] = tools
--     end
-- end
-- 
-- -- 自动安装 LSP 的自动命令
-- local augroup = vim.api.nvim_create_augroup("LSPAutoInstall", { clear = true })
-- 
-- for filetype, servers in pairs(filetype_servers) do
--     vim.api.nvim_create_autocmd("FileType", {
--         group = augroup,
--         pattern = filetype:lower(),
--         callback = function()
--             local mason_lspconfig = require("mason-lspconfig")
--             local registry = require("mason-registry")
-- 
--             for _, server in ipairs(servers) do
--                 -- 检查是否是 LSP 服务器（简单判断）
--                 if server:match("_ls$") or server:match("_lsp$") or server:match("ls$") then
--                     if not registry.is_installed(server) then
--                         vim.notify("Installing " .. server .. " for " .. filetype .. " support...")
--                         local pkg = registry.get_package(server)
--                         pkg:install():once("closed", function()
--                             if pkg:is_installed() then
--                                 vim.notify(server .. " installed successfully!")
--                                 -- 安装完成后设置 LSP
--                                 require("lspconfig")[server].setup({})
--                             end
--                         end)
--                     else
--                         -- 如果已经安装，直接设置 LSP
--                         require("lspconfig")[server].setup({})
--                     end
--                 end
--             end
--         end,
--     })
-- end
-- 
-- -- 设置全局工具（启动时安装）
-- local global_tools = ensure_installed["*"] or {}
-- for _, tool in ipairs(global_tools) do
--     if not require("mason-registry").is_installed(tool) then
--         require("mason-registry").get_package(tool):install()
--     end
-- end
