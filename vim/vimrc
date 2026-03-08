let mapleader = "\<space>"

set scrolloff=10
set ignorecase smartcase
set showmode

set number relativenumber
syntax on

set clipboard+=unnamed
nnoremap yy "+yy
vnoremap y "+y
nnoremap p "+p
vnoremap p "+p
nnoremap P "+P
vnoremap P "+P
nnoremap <leader>yy yy
vnoremap <leader>y y
nnoremap <leader>p p
vnoremap <leader>p p
nnoremap <leader>P P
vnoremap <leader>P P
nnoremap <leader>dd "+dd
vnoremap <leader>d "+d


vmap U <C-R>
nmap U <C-R>

vmap H ^
vmap L $
nmap H ^
nmap L $

nmap J 3j
vmap J 3j
nmap K 3k
vmap K 3k




" ## added by OPAM user-setup for vim / base ## d611dd144a5764d46fdea4c0c2e0ba07 ## you can edit, but keep this line
let s:opam_share_dir = system("opam var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_available_tools = []
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if isdirectory(s:opam_share_dir . "/" . tool)
    call add(s:opam_available_tools, tool)
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## ca9a5eeddca9cc8da26d7db7f5244aea ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/lumither/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
