local colors = {
    string      = "#98BB6C",
    number      = "#D27E99",
    constant    = "#FFA066",
    identifier  = "#E6C384",
    parameter   = "#b8b4d0",
    fun         = "#7E9CD8",
    statement   = "#957FB8",
    keyword     = "#957FB8",
    operator    = "#C0A36E",
    preproc     = "#E46876",
    type        = "#7AA89F",
    regex       = "#C0A36E",
    comment     = "#727169",
    punct       = "#9CABCA",
    special1    = "#7FB4CA",
    special2    = "#E46876",
    special3    = "#FF5D62",
    deprecated  = "#717C7C",
    fg          = "#DCD7BA",
    vcs_added   = "#76946A",
    vcs_removed = "#C34043",
    vcs_changed = "#DCA561",
    diag_error  = "#E82424",
    diag_warn   = "#FF9E3B",
    diag_info   = "#658594",
    diag_hint   = "#6A9589",
    diag_ok     = "#98BB6C",
}

local hl = function(name, opts)
    vim.api.nvim_set_hl(0, name, opts)
end

-- vim
hl("Comment",    { fg = colors.comment, italic = true })
hl("Constant",   { fg = colors.constant })
hl("String",     { fg = colors.string })
hl("Character",  { link = "String" })
hl("Number",     { fg = colors.number })
hl("Boolean",    { fg = colors.constant, bold = true })
hl("Float",      { link = "Number" })
hl("Identifier", { fg = colors.identifier })
hl("Function",   { fg = colors.fun })
hl("Statement",  { fg = colors.statement })
hl("Operator",   { fg = colors.operator })
hl("Keyword",    { fg = colors.keyword })
hl("Exception",  { fg = colors.special2 })
hl("PreProc",    { fg = colors.preproc })
hl("Type",       { fg = colors.type })
hl("Special",    { fg = colors.special1 })
hl("Delimiter",  { fg = colors.punct })
hl("Underlined", { fg = colors.special1, underline = true })
hl("Error",      { fg = colors.diag_error })
hl("Todo",       { fg = colors.fg, bg = colors.diag_info, bold = true })

-- treesitter
hl("@variable",                { fg = colors.fg })
hl("@variable.builtin",       { fg = colors.special2, italic = true })
hl("@variable.parameter",     { fg = colors.parameter })
hl("@variable.member",        { fg = colors.identifier })
hl("@string.regexp",          { fg = colors.regex })
hl("@string.escape",          { fg = colors.regex, bold = true })
hl("@string.special.symbol",  { fg = colors.identifier })
hl("@string.special.url",     { fg = colors.special1, undercurl = true })
hl("@attribute",              { link = "Constant" })
hl("@constructor",            { fg = colors.special1 })
hl("@constructor.lua",        { fg = colors.keyword })
hl("@operator",               { link = "Operator" })
hl("@keyword.operator",       { fg = colors.operator, bold = true })
hl("@keyword.import",         { link = "PreProc" })
hl("@keyword.return",         { fg = colors.special3 })
hl("@keyword.exception",      { fg = colors.special3 })
hl("@punctuation.delimiter",  { fg = colors.punct })
hl("@punctuation.bracket",    { fg = colors.punct })
hl("@punctuation.special",    { fg = colors.special1 })
hl("@comment.error",          { fg = colors.fg, bg = colors.diag_error, bold = true })
hl("@comment.warning",        { fg = colors.fg, bg = colors.diag_warn, bold = true })
hl("@comment.note",           { fg = colors.fg, bg = colors.diag_hint, bold = true })
hl("@markup.strong",          { bold = true })
hl("@markup.italic",          { italic = true })
hl("@markup.strikethrough",   { strikethrough = true })
hl("@markup.underline",       { underline = true })
hl("@markup.heading",         { link = "Function" })
hl("@markup.quote",           { link = "@variable.parameter" })
hl("@markup.math",            { link = "Constant" })
hl("@markup.environment",     { link = "Keyword" })
hl("@markup.link.url",        { link = "@string.special.url" })
hl("@markup.raw",             { link = "String" })
hl("@diff.plus",              { fg = colors.vcs_added })
hl("@diff.minus",             { fg = colors.vcs_removed })
hl("@diff.delta",             { fg = colors.vcs_changed })
hl("@tag.attribute",          { fg = colors.identifier })
hl("@tag.delimiter",          { fg = colors.punct })

hl("NormalFloat",              { link = "Normal" })
hl("FloatBorder",             { link = "Normal" })

hl("markdownCode",            { fg = colors.string })
hl("markdownCodeBlock",       { fg = colors.string })
