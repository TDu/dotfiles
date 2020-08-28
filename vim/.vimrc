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

filetype off

execute pathogen#infect()
"call pathogen#runtime_append_all_bundles()

filetype plugin indent on 

"Remap the leaderkey to [space bar]
let mapleader=" "

set nocompatible            "Do not be old vi compatible
set modelines=0             "To prevent some security exploit
set tabstop=4               "Don't wrap lines
set shiftwidth=4            "Number of space to use for autoindenting
autocmd Filetype xml setlocal shiftwidth=2
autocmd Filetype yaml setlocal shiftwidth=2 ts=2 sts=2 expandtab
set softtabstop=4
set expandtab
set backspace=indent,eol,start  "Allow backspacing over anything in insert mode

set encoding=utf-8
set scrolloff=3             "Keep cursor away from window edge
set autoindent
set hidden                  "No need to save when changing buffer
set showmatch               "Show matching parenthesis
set nobackup
set noswapfile
set visualbell 
set ttyfast                 "Make scrolling faster
" set showmode                "Want to know which mode I'm in
set showcmd                 "To see partial commands when typed
set relativenumber          "Have line number relative to the position"
set number

"Highlight the column if over 80, thanks Damian Conway
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

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

" --> Leader mappings
" Clears highlighted search with Leader[space]
nnoremap <leader><space> :noh<cr>
" Redraw the screen, to clean a messy term
nnoremap <leader>r :redraw!<cr>
" Enable spell checking
nnoremap <leader>s :set spell!<cr>
" Open recent used files
nnoremap <leader>m :MRU<cr>
nnoremap <leader>p :History<cr> 
" Search buffer list with fzf
nnoremap <leader>b :Buffers<cr>
" Search files pwd with fzf
nnoremap <leader>t :Files<cr>
"Easy way to edit this file (key sequence is 'e'dit 'v'imrc)
nnoremap <silent> <leader>ev :e ~/.vimrc<cr>
" And to source this file as well ( key sequence is 's'ource 'v'imrc)
" It refresh the airline status status line as well.
nnoremap <silent> <leader>sv :so $MYVIMRC
" Add the jk sequence as a way to exit insert mode
inoremap jk <esc>

"CTRL-l to move one char forward in insert mode
inoremap <c-l> <esc>la
"CTRL-d to delete the current line in insert mode
inoremap <c-d> <esc>ddi
"F11 - For fullscreen mode
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

"Syntax highlighting, colors themes and fonts
syntax enable
set t_ut=
set t_Co=256
"Fix error highlighting for spell checking
let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox
set background=dark
" let g:gruvbox_(g:gruvbox_bold) = '0'
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
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

"Change mapping to loop through open buffers
nnoremap <leader>h :bnext<cr>
nnoremap <leader>l :bprevious<cr>

"To delete the current buffer without closing the viewport
" nnoremap <leader>bd :bp <BAR> bd #<CR>

"Open NERDTree with leader n
nnoremap <leader>n :NERDTree<cr> <c-w>J
"Close NERDTree when opening a file
let NERDTreeQuitOnOpen = 1

"F4 map to make, used for jslint first.
nnoremap <F4> :w<CR>:make<CR>:cw<CR>

" So less file are highlighted like css file, while I find better
au BufNewFile,BufRead *.less set filetype=css

"Set up the status line
" set statusline=%.35F    "the last 35 char of the full file path
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
let g:airline_theme="distinguished"
 " lucius, distingished, raven

"Change the ui a little
set guioptions-=m       "Remove the menu bar
set guioptions-=T       "Remove the toolbar
set guioptions-=r       "Remove right-hand scroll bar
set guioptions-=L       "Remove left-hand scroll bar

"Set the view directory, inter alia for "mkview
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility

"For when you forget to sudo.. Really write the file.
cmap w!! w !sudo tee % >/dev/null

" Source a global configuration file if available
" Should not this be at the top or removed ?
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Spell checking
autocmd Filetype md setlocal spell spelllang=en_au
autocmd Filetype md set spell
autocmd Filetype txt set spell
" Add dictionary to autocomplete only when spellchecking is enabled
set complete+=kspell

"|---> Plugins configuration
"
" Ale
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_xml_xmllint_executable = 'xmllint'

" Ultisnips configuration
au FileType javascript :UltiSnipsAddFiletypes javascript
au FileType python :UltiSnipsAddFiletypes python
au FileType xml :UltiSnipsAddFiletypes xml
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-tab>"
" Enable split window.on edition
let g:UltiSnipsEditSplit="vertical"
" set runtimepath+=~/.vim/ultisnips_rep

" Setup LSP config for various language
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx']
      \ })
endif
if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
endif

" fzf
set rtp+=~/.fzf
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
