" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"" Color Scheme
syntax enable
set background=dark
colorscheme solarized

"" Formatting
set expandtab                                   " tabs are spaces
set shiftwidth=2                                " number of spaces to user for each indentation step
set softtabstop=2                               " number of spaces in tab when editing
set tabstop=2                                   " number of visual spaces per TAB
set wrap                                        " switch wrap on for everything

filetype indent on                              " load filetype-specific indent files
filetype plugin on                              " load filetype-specific plugin files

"" UI Config
set showcmd                                     " show command in bottom bar
set cursorline                                  " horizonal highlight (current line)
set cursorcolumn                                " vertical highlight (current column)
set showmatch                                   " highlight matching parentheses
set laststatus=2                                " always display the status line

" better statusline
set statusline=%t                               "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}]                         "file format
set statusline+=%h                              "help file flag
set statusline+=%m                              "modified flag
set statusline+=%r                              "read only flag
set statusline+=%y                              "filetype
set statusline+=%=                              "left/right separator
set statusline+=%c,                             "cursor column
set statusline+=%l/%L                           "cursor line/total lines
set statusline+=\ %P                            "percent through file

"" Performance
set ttyfast                                     " faster redraw
set lazyredraw                                  " redraw only when we need to

"" Searching
set incsearch                                   " search as characters are entered
set hlsearch                                    " highlight matches

"" Key Mapping
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" prevent jumping viewpane to top/bottom of file
inoremap <S-Up> <Nop>
inoremap <S-Down> <Nop>
nnoremap <S-Up> <Nop>
nnoremap <S-Down> <Nop>

" get the correct indent for new lines despite blank lines
inoremap <CR> <CR><Space><BS>

"" Miscellaneous
set wildmenu                                    " visual autocomplete for command menu
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" Local Config
if filereadable('.vimrc.local')
  source .vimrc.local
endif
