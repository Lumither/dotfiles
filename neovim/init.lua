vim.cmd('source ~/.vimrc')

require('lazy_setup')

require('config.editor')
require('config.keymap')
require('plugins')
require('config.colorscheme')
require('config.lsp')

