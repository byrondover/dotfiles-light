" Use Vim settings, rather then Vi settings (much better!).
" These options must come first, because they change other options as a side effect.

set nocompatible
filetype off

set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

"------------------------------------------------------------------------------
" Vundle
"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" set plugin variables
let g:Powerline_stl_path_style = 'full'

" load plugins
Plugin 'VundleVim/Vundle.vim'                     " let Vundle manage Vundle (required)
Plugin 'Lokaltog/vim-powerline'                   " statusline plugin

" all plugins must be added before the following line
call vundle#end()            " required

"------------------------------------------------------------------------------
" Color Scheme
"

let g:solarized_termtrans=1
let g:solarized_visibility="high"

syntax enable
set background=dark
silent! colorscheme solarized

"------------------------------------------------------------------------------
" Formatting
"

filetype indent on                                " load filetype-specific indent files
filetype plugin on                                " load filetype-specific plugin files

set autoindent                                    " copy indent from current line to new line
set smartindent                                   " automatically indent after parentheses
set smarttab                                      " smarter tab levels
set expandtab                                     " use spaces, not tabs
set shiftwidth=2                                  " number of spaces to user for each indentation step
set softtabstop=2                                 " number of spaces in tab when editing
set tabstop=2                                     " number of visual spaces per TAB
set wrap                                          " switch wrap on for everything
set nofixeol                                      " don't enforce newline characters at the end of files

" no tab highlight for Go
au FileType go set nolist

" use real tabs in Makefiles, not tabs expanded to spaces
au FileType make set nolist noexpandtab

" make Python follow PEP8 (http://www.python.org/dev/peps/pep-0008)
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" clean trailing spaces on save
au BufWritePre * kz|:%s/\s\+$//e|'z

"------------------------------------------------------------------------------
" UI Config
"

set number                                        " show line numbers
set showcmd                                       " show command in bottom bar
set showmatch                                     " highlight matching parentheses
set cursorline                                    " horizonal highlight (current line)
set cursorcolumn                                  " vertical highlight (current column)
set laststatus=2                                  " always display the status line

" syntax highlighting
set list                                          " highlights specific characters, defined below
set listchars=""                                  " reset listchars
set listchars=tab:‣\                              " display tabs with a sign
set listchars+=trail:·                            " display trailing whitespaces with a dot
set listchars+=extends:»                          " right wrap
set listchars+=precedes:«                         " left wrap

" scrolling
set scrolloff=5                                   " number of lines above and below the cursor
set sidescrolloff=5                               " number of lines left and right below the cursor
set sidescroll=1                                  " side scroll one line at a time

" statusline
"set statusline=%F                                 " tail of the filename
"set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}] " file encoding
"set statusline+=[%{&ff}]                          " file format
"set statusline+=%y                                " filetype
"set statusline+=%h                                " help file flag
"set statusline+=%r                                " read only flag
"set statusline+=%m                                " modified flag
"set statusline+=%=                                " left/right separator
"set statusline+=%c,                               " cursor column
"set statusline+=%l/%L                             " cursor line/total lines
"set statusline+=\ %P                              " percent through file

"------------------------------------------------------------------------------
" Performance
"

set ttyfast                                       " faster redraw
set lazyredraw                                    " redraw only when we need to
set viminfo='100,\"100,:20,%,n~/.viminfo          " persist command history between sessions

" backup
silent !mkdir ~/.vim/tmp > /dev/null 2>&1
set backup
set backupdir=~/.vim/tmp,~/tmp,/tmp,.
set backupskip=/private/tmp/*,/tmp/*
set writebackup

" swap
set directory=~/.vim/tmp,~/tmp,/tmp,.

" undo
silent !mkdir ~/.vim/cache > /dev/null 2>&1
set undodir=~/.vim/cache
set undofile

"------------------------------------------------------------------------------
" Searching
"

set incsearch                                     " search as characters are entered
set hlsearch                                      " highlight matches
set ignorecase                                    " searches are case insensitive
set smartcase                                     " unless the search contains a capital letter

"------------------------------------------------------------------------------
" Navigation
"

set incsearch                                     " search as characters are entered
set wildmenu                                      " visual autocomplete for command menu
set wildignore=*.o,*.out,*.obj,*.class
set wildignore+=*.swp,*~,._*
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=.git,.svn
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*/vendor/assets/**
set wildignore+=*/vendor/rails/**
set wildignore+=*/vendor/cache/**
set wildignore+=*/vendor/bundle/**
set wildignore+=*/vendor/submodules/**
set wildignore+=*/vendor/plugins/**
set wildignore+=*/vendor/gems/**
set wildignore+=*/.bundle/**
set wildignore+=*.gem
set wildignore+=*/log/**
set wildignore+=*/tmp/**
set wildignore+=*/_vendor/**

"------------------------------------------------------------------------------
" Key Mapping
"

set backspace=indent,eol,start                    " make backspace work as expected
set pastetoggle=<C-P>                             " toggles the paste option

" turn off search highlight (by default, leader key is \)
nnoremap <leader><space> :nohlsearch<CR>

" prevent jumping viewpane to top/bottom of file
inoremap <S-Up> <Up>
inoremap <S-Down> <Down>
nnoremap <S-Up> <Up>
nnoremap <S-Down> <Down>

" shift-tab to insert real tab character in insert mode
inoremap <S-Tab> <C-V>009

" get the correct indent for new lines despite blank lines
inoremap <CR> <CR><Space><BS>

" force newline with no indentation
inoremap <leader><CR> <C-O>:set paste<CR><CR><C-O>:set nopaste<CR>

" toggle line numbers
inoremap <C-N> <C-O>:set invnumber<CR>
nnoremap <C-N> :set invnumber<CR>

"------------------------------------------------------------------------------
" Miscellaneous
"

set autoread                                      " refresh file when changed outside of Vim
set history=1000                                  " increase command history default
set visualbell                                    " flash cursor instead of trigger bell
set noerrorbells                                  " mininize error bell noisiness

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" remember last location in file, but not for commit messages
" see :help last-position-jump
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

au BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()
au BufNewFile,BufRead *.json set ft=javascript

" enable jinja2 syntax highlighting in html files
" requires: http://www.vim.org/scripts/script.php?script_id=1856
autocmd FileType html setlocal syntax=htmljinja

"------------------------------------------------------------------------------
" Local Configuration
"

if filereadable('.vimrc.local')
  source .vimrc.local
endif
