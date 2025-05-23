filetype on
filetype plugin indent on 

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
set smartindent
set autoindent
set hidden                  "No need to save when changing buffer
set showmatch               "Show matching parenthesis
set nobackup
set noswapfile
set visualbell 
set ttyfast                 "Make scrolling faster
set showcmd                 "To see partial commands when typed
set relativenumber          "Have line number relative to the position"
set number

set mouse=a

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

" Configure folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Leader mappings
let mapleader=" "                       "Remap the leader key to [space]
nnoremap <leader><space> :noh<cr>       "Empty status line
nnoremap <leader>s :set spell!<cr>      "Enable spell checking
" Insert mode mappings
" Add the jk sequence as a way to exit insert mode
inoremap jk <esc>
"CTRL-l to move one char forward in insert mode
inoremap <c-l> <esc>la

" Set the color theme to match light or dark from tmux
function! SetColorScheme()
    " Set color scheme matching tmux light or dark theme
    if system('tmux show-environment THEME')[0:9] == 'THEME=dark'
        set background=dark
        colorscheme gruvbox
        let g:airline_theme="distinguished"
    else
        set background=light
        colorscheme PaperColor
        let g:airline_theme="papercolor"
    endif
endfunction
nnoremap <leader>o :call SetColorScheme()<cr>

"F11 - For fullscreen mode
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

"Syntax highlighting, colors themes and fonts
syntax enable
set t_ut=
set t_Co=256
"Fix error highlighting for spell checking
let g:gruvbox_guisp_fallback = "bg"

" colorscheme gruvbox
set background=dark
" let g:gruvbox_(g:gruvbox_bold) = '0'
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

"Set the font for graphical vim
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
nnoremap <leader>n :NERDTreeFocus<cr>
nnoremap <leader>N :NERDTreeFind<cr>
"Toggle NERDTree with CTRL-t moving to the current file directory
nnoremap <C-t> :NERDTreeToggle %:p:h<CR>
"Close NERDTree when opening a file
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize=60


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
" Change misspelled word style
hi SpellBad cterm=underline
hi SpellLocal cterm=underline
hi SpellRare cterm=underline
hi SpellCap cterm=underline

"|---> Plugins configuration
"
" Ale
let g:ale_disable_lsp = 1
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_xml_xmllint_executable = 'xmllint'

" ----------------------------------------
" Old lsp configuration
" let g:lsp_document_highlight_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
" let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 0

" Git gutter
" Disable its mapping as <leader> h.. is already used.
let g:gitgutter_map_keys = 0

" fzf
" Need both path depending where it has been installed
set rtp+=~/.fzf
set rtp+=~/src/fzf
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

" Improve word selection from spellcheck
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

" Search file content in git project -> Disabled already have :Rg
" command! -bang -nargs=* PRg
"   \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'dir': system('git rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)

" let g:LanguageClient_useVirtualText = 0
