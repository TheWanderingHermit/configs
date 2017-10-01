" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set terminal to 256 colors
" set t_Co=256

" Enable plugin management
execute pathogen#infect()

" Return to the last position where the file was closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Enable syntax
syntax enable

" Enable syntax highlighting.
syntax on

" Automatically indent when adding a curly bracket, etc.
set smartindent

" Tabs should be converted to a group of 4 spaces.
" This is the official Python convention
" (http://www.python.org/dev/peps/pep-0008/)
" I didn't find a good reason to not use it everywhere.
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set smartcase

" Display line numbers
set number

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=999

" Use UTF-8.
set encoding=utf-8

" Set color scheme that I like.
if has("gui_running")
    set background=light
else
    set background=dark
endif
colorscheme solarized

" Status line
set laststatus=2
set statusline=
" set statusline+=%-3.3n\ " buffer number
" set statusline+=%f\ " filename
" set statusline+=%h%m%r%w " status flags
" set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
" set statusline+=%= " right align remainder
" set statusline+=0x%-8B " character value
" set statusline+=%-14(%l,%c%V%) " line, character
" set statusline+=%<%P " file position

" Show line number, cursor position.
set ruler

" Display incomplete commands.
set showcmd

" To insert timestamp, press F3.
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" To save, press ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Search as you type.
set incsearch

" Highlight search
set hlsearch

" Ignore case when searching.
set ignorecase

" Show autocomplete menus.
set wildmenu

" Show editing mode
set showmode

" Error bells are displayed visually.
" set visualbell

" Enable filetype plugins
filetype plugin indent on

" Enable Tagbar toggle using F8
nmap <F8> :TagbarToggle<CR>

" Enable status line content for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Enable basic options for Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Set vim-airline theme
let g:airline_theme='wombat'

" Open NERDTree by default
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ycm configuration
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" vim pencil configurations
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END
