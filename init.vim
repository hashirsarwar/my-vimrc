" NVIM v0.4.x required
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'shougo/deoplete.nvim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'pangloss/vim-javascript'
Plug 'kh3phr3n/python-syntax'
Plug 'gruvbox-community/gruvbox'
call plug#end()
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
colorscheme gruvbox
set nohlsearch
set cursorline
set hidden
set nowrap
set number
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set updatetime=250
set ignorecase
set termguicolors
set noshowmode
set splitbelow
set clipboard=unnamedplus
tnoremap jj <C-\><C-n>
inoremap jj <ESC>
noremap <C-p> <esc>:Files<CR>
noremap <C-n> <esc>:15Lexplore<CR>
command! E Explore
command! BD bp | bd #
command! T 6sp|:terminal
au BufRead,BufNewFile *.hbs setfiletype html
au TermOpen * setlocal nonumber norelativenumber nocursorline nobuflisted
"let g:coc_global_extensions = [
"            \'coc-flow',
"            \'coc-json',
"            \'coc-prettier',
"            \'coc-tsserver',
"            \'coc-snippets',
"            \'coc-eslint',
"            \'coc-python',
"            \]
" Install eslint
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
"    if (index(['vim','help'], &filetype) >= 0)
"        execute 'h '.expand('<cword>')
"    else
"        call CocAction('doHover')
"    endif
"endfunction
" Automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>
let python_highlight_all = 1

command! -bang -nargs=* Search call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0)
let g:netrw_banner=0
