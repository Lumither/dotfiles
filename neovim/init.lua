require('lazy_setup')

require('config.editor')
require('config.filetype')
require('config.keymap')

if not vim.g.vscode then
    require('config.colorscheme')
    require('config.lsp')
end
