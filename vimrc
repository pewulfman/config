"
"
"
"  .vimrc
"
"
"

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"" comment the following to make vim more vi-compatible
set nocompatible

"" To avoid the ^M bug...
set fileformat=unix
set fileencoding=utf-8

"" Vim5 and later versions support syntax highlighting. Uncommenting the next line enables syntax highlighting by default.
syntax enable
syntax on


"" Color theme
"" Available themes:
"" 	mustang, vitamins, desert, vylight, molokai


if &term =~ 'xterm-256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

if &term =~ 'ansi'
	set t_Co=16
endif

colorscheme solarized
"colorscheme mustang
set background=dark

"" uncomment to disable viminfo
" set viminfo="NONE"

"" Uncomment the following to have Vim jump to the last position when
"" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"" Uncomment the following to have Vim load indentation rules and plugins
"" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif



set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

set number
set ts=4
set shiftwidth=4

"" python autocomplete  ( word + <Ctrl-n> or <Ctrl-p> )
"" another completion with documentation available with ( class [dot]
"" <Ctrl-x><Ctrl-o>

if has("autocmd")
	autocmd FileType python set complete+=k/~/.vim/pydiction-1.2/pydiction isk+=.,(
endif

"""""Load install plugins
"" Load the Tcomment plugin
"" ctrl-c to comment a single line 
"" ctrl-x to un-comment a single line 
"" shift-v and select multiple lines, then ctrl-c to comment the selected multiple lines 
"" shift-v and select multiple lines, then ctrl-x to un-comment the selected multiple lines

if filereadable("~/.vim/plugin/comments.vim")
	source ~/.vim/plugin/comments.vim
endif

    " MRU (type :MRU) -- DISABLED
 	"- Displays last opened files in a window, easy to select them then
if has("autocmd")
	autocmd VimEnter * MRU
endif
