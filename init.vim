

call plug#begin('/home/eddie/.config/nvim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'frazrepo/vim-rainbow'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'valloric/youcompleteme'
call plug#end()



" Spaces and indent
set expandtab           " tabs are spaces
set shiftwidth=2     " size of indents in spaces
set tabstop=2       " simulate tabs with this many spaces

" FileType specific tab overrides
filetype plugin indent on " Enable filetype detection and <filetype>.vim loading
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2

" Line numbers and mouse
set number      " enable line numbers
set mouse=a     " enable mouse in auto mode

" Searching
set incsearch 	" don't wait for the enter key to start searching
set hlsearch    " highlight search results
set ignorecase
set smartcase

" Syntax highlighting and themes
syntax enable       " turn on syntax highlighting

colorscheme gruvbox   " use the slate theme
set background=dark
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Map gl to the previously used tab
let g:lasttab = 1
nmap gl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

" Strip trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

autocmd BufWritePre * :call TrimWhitespace() " Call TrimWhitespace on save

" Misc
set wildmenu    " show tab completions for commands inline

" Files to ignore for various auto completion commands
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,__pycache__,node_modules

" Remap the dd shortcut to not override the yank register

vnoremap <C-c> "+y
map <C-v> "+P

vnoremap <C-c> "*y :let @+=@*<CR>


inoremap jk <ESC>

filetype indent on
set smartindent
autocmd BufRead,BufWritePre *.sh normal gg=G
