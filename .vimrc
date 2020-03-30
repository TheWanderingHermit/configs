" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
let mapleader = "\<Space>"

" Set terminal to 256 colors
set t_Co=256

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

" Switch buffers without closing them
set hidden

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

" Set vim-airline theme
let g:airline_theme='hybrid'
let g:airline#extensions#tabline#enabled=1

" Status line
" set laststatus=2
" set statusline=
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

" set indent based folding
set foldmethod=indent
set foldlevel=99

" Enable status line content for Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" Enable basic options for Syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeIgnore=[]
let g:NERDTreeStatusline=''
" Toggle
" Open NERDTree by default
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ycm configuration

let g:ycm_global_ycm_extra_conf='/Users/sidharthsharma/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" 
let g:ycm_register_as_syntastic_checker=1 "default 1
let g:Show_diagnostics_ui=1 "default 1

" will put icons in Vim's gutter on lines that have a diagnostic set.
" Turning this off will also turn off the YcmErrorLine and YcmWarningLine
" highlighting
let g:ycm_enable_diagnostic_signs=1
let g:ycm_enable_diagnostic_highlighting=0
let g:ycm_always_populate_location_list=1 "default 0
let g:ycm_open_loclist_on_ycm_diags=1 "default 1
 
let g:ycm_complete_in_strings=1 "default 1
let g:ycm_collect_identifiers_from_tags_files=0 "default 0
let g:ycm_path_to_python_interpreter='' "default ''
 
let g:ycm_server_use_vim_stdout=0 "default 0 (logging to console)
let g:ycm_server_log_level='info' "default info
 
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf=1

let g:ycm_goto_buffer_command='same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist={ '*': 1 }
let g:ycm_key_invoke_completion='<C-Space>'
let g:ycm_autoclose_preview_window_after_completion=1
 
" 
" nerdcommenter
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
" let g:NERDDefaultAlign = 'left'
" let g:NERDAltDelims_java = 1
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1

" special syntax highlighting for q programming language
" hi Special ctermfg=red " for query specific keywords
" hi Underlined ctermfg=magenta cterm=bold " for local variables
set tags=tags;


" use fzf with vim
"set runtimepath+=/usr/local/opt/fzf

" dont jump to the first search result

" enable vim pencil only while editing text ( txt, markdown, etc. ) files
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
                            \ | call lexical#init()
                            \ | call litecorrect#init()
                            \ | call textobj#quote#init()
                            \ | call textobj#sentence#init()
  autocmd FileType text         call pencil#iinit()
augroup END

" load language specific configurations
" python
autocmd bufenter *.py :source $HOME/.vim/filetypes/python.vim

" custom mappings
" search in source code
nnoremap <Leader>a :Ack!<Space>
" youcompleteme go to definitions else declarations
" nnoremap <leader>g YcmCompleter GoToDefinitionElseDeclaration<CR>
" toggle nerd tree
nnoremap <leader>t :NERDTreeToggle<CR>
" map FZF to <leader>f
" fuzzy file find
" nnoremap <leader>f :Files<CR>
" To insert timestamp, press F3.
nnoremap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
inoremap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
" get youcompleteme diagnostics
nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

" To save, press ctrl-s.
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a
" goto previous buffer
nnoremap bp :bp<CR>
" goto next buffer
nnoremap bn :bn<CR>
" list all buffers and input buffer to navigate to on prompt
nnoremap bs :ls<CR>:b<Space>
