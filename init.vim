call plug#begin()
Plug 'lifepillar/vim-mucomplete'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-signify'
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/lightline.vim'
Plug 'alvan/vim-closetag'
call plug#end()
set termguicolors
set number
set cursorline
set updatetime=350
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set ignorecase
set noshowmode
set clipboard=unnamedplus
set completeopt+=menuone
set completeopt+=noselect
set completeopt-=preview
color jellybeans
tnoremap jj <C-\><C-n>
inoremap jj <ESC>
noremap <C-n> <esc>:15Lexplore<CR>
command! BD bp | bd #
command! T belowright 6split|:terminal
au TermOpen * setlocal nonumber norelativenumber hidden
let g:netrw_banner=0
let g:ctrlp_regexp = 1
let g:lightline = {'colorscheme':'jellybeans','active':{'left':[['mode','paste'],['gitbranch','readonly','filename','modified']]},'component_function':{'gitbranch':'FugitiveHead','filename':'LightlineFilename'}}
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
