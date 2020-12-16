if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'xuhdev/vim-latex-live-preview'
call plug#end()

" let g:airline_powerline_fonts = 1

set updatetime=100

set nolist
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
hi SpecialKey ctermfg=grey guifg=grey70
hi NonText ctermfg=grey guifg=grey70

set number
set autoindent
set smartindent
set colorcolumn=80
syntax on

