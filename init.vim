call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-signify'
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/lightline.vim'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-buftabline'
Plug 'raimondi/delimitmate'
call plug#end()
set cursorline
set number
set nowrap
set updatetime=350
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set ignorecase
set clipboard=unnamedplus
set noshowmode
set hidden
tnoremap jj <C-\><C-n>
inoremap jj <ESC>
noremap <C-n> <esc>:15Lexplore<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>
command! BD bp | bd #
au TermOpen * setlocal nonumber
command! T belowright 6split|:terminal
let g:netrw_banner=0
let g:ctrlp_regexp = 1
color jellybeans
let g:lightline = {'colorscheme':'jellybeans','active':{'left':[['mode','paste'],['gitbranch','readonly','filename','modified']]},'component_function':{'gitbranch':'FugitiveHead','filename':'LightlineFilename'}}
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>
let g:deoplete#enable_at_startup = 1
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
