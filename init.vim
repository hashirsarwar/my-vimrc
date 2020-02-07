" NVIM v0.4.x required
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'raimondi/delimitmate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim' " Requires ripgrep to search content in files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'pangloss/vim-javascript'
Plug 'gruvbox-community/gruvbox'
Plug 'scrooloose/nerdtree'
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
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = '%3p%% ☰  %l:%c'
let g:airline_theme='ayu_dark'
let g:airline_powerline_fonts = 1 " Make sure terminal fonts has powerline support.
let g:airline_skip_empty_sections=1
command! E Explore
command! BD bp | bd #
command! T 6sp|:terminal
command! Search Rg
au BufRead,BufNewFile *.hbs setfiletype html
au TermOpen * setlocal nonumber norelativenumber nocursorline nobuflisted
let g:coc_global_extensions = [
            \'coc-flow',
            \'coc-json',
            \'coc-prettier',
            \'coc-tsserver',
            \'coc-snippets',
            \'coc-eslint',
            \'coc-python',
            \]
" Install jedi, eslint
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

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

command! PrevTerminal execute 'buffer ' . buf#previous('&buftype == "terminal"')
command! NextTerminal execute 'buffer ' . buf#next('&buftype == "terminal"')
cnoreabbrev tn NextTerminal
cnoreabbrev tp PrevTerminal
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
