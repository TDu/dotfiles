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
call pathogen#runtime_append_all_bundles()
filetype plugin indent on 

"Remap the leaderkey to ,
let mapleader=","

set nocompatible            "Do not be old vi compatible
set modelines=0             "To prevent some security exploit
set tabstop=4               "Don't wrap lines
set shiftwidth=4            "Number of space to use for autoindenting
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

"Highlight the column if over 80, thanks Damian Conway
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
set colorcolumn=90 

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

"Syntax highlighting, colors themes and fonts
syntax enable
set background=dark
colorscheme gruvbox
"color desert_plus
"Set a different colorscheme for txt files
"autocmd! BufEnter,BufNewFile *.txt color morning
"autocmd! BufLeave *.txt color gruvbox

"Set the font
if MySys() == "linux"
    set guifont="Droid Sans Mono":h10:cANSI
else
    set guifont=Droid_Sans_Mono:h10:cANSI
endif

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
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Switch between buffers on the same viewport with ctrl-tab and ctrl-shift-tab
nnoremap <C-n> :bnext<cr>
nnoremap <C-p> :bprevious<cr>
"Maybe this would be more vim like but no sure if I like it
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>l :bnext<cr>
"To delete the current buffer without closing the viewport
nnoremap <leader>bd :bp <BAR> bd #<CR>

"Open NERDTree with leader n
nnoremap <leader>n :NERDTree<cr>
"Close NERDTree when opening a file
let NERDTreeQuitOnOpen = 1

"F4 map to make, used for jslint first.
nnoremap <F4> :w<CR>:make<CR>:cw<CR>


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

"Have a taller window if running in gui mode
"if has("gui_running")
    "set lines=60 columns=88
"endif

"Remove menu bar, for when it's needed ;)
set guioptions-=m
" Remove toolbar

set guioptions-=T

"Set the view directory, inter alia for "mkview"
if MySys() == "linux"
    "set viewdir=~/Dropbox/config/vim/views
else
     "set viewdir=c:\local\Dropbox\config\vim\views
endif    
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility

"Easy way to edit this file (key sequence is 'e'dit 'v'imrc)
"if MySys() == "linux"
nnoremap <silent> <leader>ev :e ~/.vimrc<cr>
"else
    "nnoremap <silent> <leader>ev :e c:\local\Dropbox\config\vim\vimrc<cr>
"endif
"And to source this file as well ( key sequence is 's'ource 'v'imrc)
nnoremap <silent> <leader>sv :so $MYVIMRC<cr>

"Instead of esc to change mode use jk and disable esc way
inoremap jk <esc>
inoremap <esc> <nop>

"CTRL-d to delete the current line in insert mode
inoremap <c-d> <esc>ddi

"CTRL-k to move one char forward in insert mode
inoremap <c-l> <esc>la

"F11 - For fullscreen mode
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

"To solve the problem I had creating bash script under Windows
"and execute them in bash
au BufWritePre * :set binary | set noeol
au BufWritePost * :set nobinary | set eol

"For when you forget to sudo.. Really write the file.
cmap w!! w !sudo tee % >/dev/null

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"if MySys() == "linux"
"    source ~/Dropbox/config/vim/bundle/closetag/plugin/closetag.vim
"else
"    source c:\local\Dropbox\config\vim\bundle\closetag\plugin\closetag.vim
"endif

"Active F3 with bufferlist plugin
map <silent> <F3> :call BufferList()<CR>

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

"
"augroup filetype_html
    "autocmd!
    "autocmd BufWrite,BufRead *.html :normal gg=G
"augroup end

"augroup filetype_javascript
    "autocmd!
    "autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
"augroup end

"augroup filetype_python
    "autocmd!
    "autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
"augroup end