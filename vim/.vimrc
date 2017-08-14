" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" Work this out...
" This is some leftover from when used to work on Windows too
fun! MySys()
    return "linux"
endfun

if MySys() == "linux"
    runtime! debian.vim
endif

"Use pathogen plugin to keep all plugin files in order
filetype off
"call pathogen#runtime_append_all_bundles()
execute pathogen#infect()
filetype plugin indent on 

"Remap the leaderkey to space bar
let mapleader=" "

set nocompatible            "Do not be old vi compatible
set modelines=0             "To prevent some security exploit
set tabstop=4               "Don't wrap lines
set shiftwidth=4            "Number of space to use for autoindenting
autocmd Filetype xml setlocal shiftwidth=2
set softtabstop=4
set expandtab
set backspace=indent,eol,start  "Allow backspacing over anything in insert mode

set encoding=utf-8
set scrolloff=3             "Keep cursor away from window edge
set autoindent
set hidden                  "No need to save when changing buffer
set showmatch               "Show matching parenthesis
set nobackup
"set noswapfile
set visualbell 
set ttyfast                 "Make scrolling faster
set showmode                "Want to know which mode I'm in
set showcmd                 "To see partial commands when typed
set relativenumber          "Have line number relative to the position"
set number

"Highlight the column if over 80, thanks Damian ConwayirlineRefresh
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
"set colorcolumn=90

"Enable enhanced command-line completion
set wildmenu
set wildmode=list:longest
"Set the current path to the path of the file in the current buffer
set autochdir

"Make use normal regex, by inserting \v before any string search 
nnoremap / /\v
vnoremap / /\v
"If search word is lower case, finds all occurences even with capitals
set ignorecase
set smartcase
set gdefault                "So no need to add the g at the end of a search
"Highlight search result as you type
set incsearch
set hlsearch
"Clears highlighted search with Leader[space]
nnoremap <leader><space> :noh<cr>

"Redraw the screen, useful when working in the terminal and a background job
"print some output
nnoremap <leader>r :redraw!<cr>

"Syntax highlighting, colors themes and fonts
syntax enable
set t_Co=256
set background=dark
colorscheme gruvbox
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

"color desert_plus
"Set a different colorscheme for txt files
"autocmd! BufEnter,BufNewFile *.txt color darkblue
"autocmd! BufLeave *.txt color gruvbox

"Set the font
set guifont="Droid Sans Mono":h10:cANSI

"Warn about tabs and trailling spaces
set listchars=tab:>~,nbsp:_,trail:.
set list

"Highlight the line under the cursor, but only for the current viewport
set cursorline
augroup cursor_line
    autocmd!
    autocmd WinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup end

"Make Y behave like other capitals
map Y y$

"Change mapping to switch between viewport
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

"Switch between buffers on the same viewport with ctrl-tab and ctrl-shift-tab
nnoremap <C-l> :bnext<cr>
nnoremap <C-h> :bprevious<cr>

"To delete the current buffer without closing the viewport
nnoremap <leader>bd :bp <BAR> bd #<CR>

"Open NERDTree with leader n
nnoremap <leader>n :NERDTree<cr>
"Close NERDTree when opening a file
let NERDTreeQuitOnOpen = 1

"F4 map to make, used for jslint first.
nnoremap <F4> :w<CR>:make<CR>:cw<CR>

" So less file are highlighted like css file, while I find better
au BufNewFile,BufRead *.less set filetype=css

"Set up the status line
set statusline=%.35F    "the last 35 char of the full file path
set statusline+=%R      "Warning if file is readonly"
set statusline+=%m
set statusline+=\ -\    "spearator
set statusline+=%y      "file type
set statusline+=%=      "switch to right side
set statusline+=[%02n]\   "Buffer number in brackets"
set statusline+=%B      "hexa value of char under cursor"
set statusline+=...
set statusline+=%l      "current line
set statusline+=/
set statusline+=%L      "total number of lines

set laststatus=2        "Have a more detailed status line

" Airline plugin config
let g:airline_powerline_fonts = 1
let ttimeoutlen=10
let g:airlinetheme="bubblegum"

"Have a taller window if running in gui mode
"if has("gui_running")
    "set lines=60 columns=88
"endif

"Change the ui a little
set guioptions-=m       "Remove the menu bar
set guioptions-=T       "Remove the toolbar
set guioptions-=r       "Remove right-hand scroll bar
set guioptions-=L       "Remove left-hand scroll bar

"Set the view directory, inter alia for "mkview"
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility

"Easy way to edit this file (key sequence is 'e'dit 'v'imrc)
nnoremap <silent> <leader>ev :e ~/.vimrc<cr>

" And to source this file as well ( key sequence is 's'ource 'v'imrc)
" It refresh the airline status status line as well.
nnoremap <silent> <leader>sv :so $MYVIMRC<cr> <bar> AirlineRefresh

"Instead of esc to change mode use jk
inoremap jk <esc>

"CTRL-d to delete the current line in insert mode
inoremap <c-d> <esc>ddi

"CTRL-l to move one char forward in insert mode
inoremap <c-l> <esc>la

"F11 - For fullscreen mode
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

"To solve the problem I had creating bash script under Windows
"and execute them in bash
"au BufWritePre * :set binary | set noeol
"au BufWritePost * :set nobinary | set eol

"For when you forget to sudo.. Really write the file.
cmap w!! w !sudo tee % >/dev/null

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Plugins configuration

"Active F3 with bufferlist plugin
map <silent> <F3> :call BufferList()<CR>

"" Ultisnips configuration
au FileType javascript :UltiSnipsAddFiletypes javascript
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-tab>"
"" Enable split window.on edition
let g:UltiSnipsEditSplit="vertical"
"" set runtimepath+=~/.vim/ultisnips_rep

"Configuration syntastic plugin
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_html_checkers = ['w3']
"let g:syntastic_javascript_checkers = ['eslint']


"Centralize swap and backup files
if isdirectory(expand('~/.cache/vim'))
  if &directory =~# '^\.,'
    set directory^=~/.cache/vim/swap//
  endif
  if &backupdir =~# '^\.,'
    set backupdir^=~/.cache/vim/backup//
  endif
  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    set undodir^=~/.cache/vim/undo//
  endif
endif
if exists('+undofile')
  set undofile
endif
if MySys() == "windows"
    set noundofile
endif
