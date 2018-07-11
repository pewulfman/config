set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
let mapleader = "<"

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-sensible'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-scripts/comment.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'walm/jshint.vim'
Plugin 'moll/vim-node'
Plugin 'Yggdroot/indentLine'
Plugin 'nvie/vim-flake8'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'

if has('python')
    Plugin 'davidhalter/jedi-vim'
endif


call vundle#end()

""Uncomment the following to have Vim load indentation rules and plugins
""according to the detected filetype.
filetype plugin indent on
filetype plugin on


"" To avoid the ^M bug...
"set fileformat=unix
set fileencoding=utf-8

"" Vim5 and later versions support syntax highlighting. Uncommenting the next line enables syntax highlighting by default.
syntax enable
syntax on


"" Color theme
if &term =~ 'xterm-256color'
" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
" See also http://snk.tuxfamily.org/log/vim-256color-bce.html
""set t_ut=
endif

if &term =~ 'ansi'
	set t_Co=16
endif

colorscheme solarized
set background=dark

"" uncomment to disable viminfo
 set viminfo="NONE"

"" Uncomment the following to have Vim jump to the last position when
"" reopening a file
if has("autocmd")
 au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


""Key remaping
nnoremap <C-z> <C-x>
noremap <F2> :NERDTreeToggle <CR>
nnoremap <a-Tab> :bn <CR>


set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden           " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

set number
set tabstop=4
set shiftwidth=4

set autoindent
set smartindent
set smarttab

set expandtab


""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""""""""""""""""


" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCompactSexyComs = 1

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" YCM
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_python_binary_path = '/usr/bin/python3'
" disable php semantic trigger because of freeze
let g:ycm_semantic_triggers =  {
			\   'c' : ['->', '.'],
			\   'objc' : ['->', '.'],
			\   'ocaml' : ['.', '#'],
			\   'cpp,objcpp' : ['->', '.', '::'],
			\   'perl' : ['->'],
			\   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
			\   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
			\   'ruby' : ['.', '::'],
			\   'lua' : ['.', ':'],
			\   'erlang' : [':'],
			\ }
highlight YcmErrorSection   guibg=Red
highlight YcmWarningSection guibg=Blue

"autocmd vimenter * NERDTree

"CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_cmd = 'CtrlMixed'

" instant-markdown
let g:instant_markdown_slow = 1


""MiniBuff config""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" jedi
autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_command = "<C-n>"
