call plug#begin()
Plug 'airblade/vim-gitgutter'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'pangloss/vim-javascript'
Plug 'raimondi/delimitmate'
call plug#end()
set cursorline
set nowrap
set number
set tabstop=4
set shiftwidth=4
set expandtab
set termguicolors
set smarttab
set updatetime=250
set ignorecase
set noshowmode
set splitbelow
set clipboard=unnamedplus
tnoremap jj <C-\><C-n>
inoremap jj <ESC>
noremap <C-p> <esc>:Files<CR>
noremap <C-n> <esc>:15Lexplore<CR>
command! BD bp | bd #
command! T 6sp|:terminal
au BufRead,BufNewFile *.hbs setfiletype html
au TermOpen * setlocal nonumber norelativenumber nocursorline hidden
"let g:coc_global_extensions = [
"            \'coc-flow',
"            \'coc-json',
"            \'coc-prettier',
"            \'coc-tsserver',
"            \'coc-snippets',
"            \'coc-eslint',
"            \'coc-python',
"            \]
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
"    if (index(['vim','help'], &filetype) >= 0)
"        execute 'h '.expand('<cword>')
"    else
"        call CocAction('doHover')
"    endif
"endfunction
let g:deoplete#enable_at_startup = 1
let $FZF_DEFAULT_OPTS='--layout=reverse'
command! -bang -nargs=* S call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0)
let g:netrw_banner=0
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1 
