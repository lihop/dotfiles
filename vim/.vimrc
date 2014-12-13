set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'chase/vim-ansible-yaml'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/csapprox'
" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

if has("syntax")
    "Enable syntax highlighting
    syntax enable 
    " Set 256 color terminal support
    set t_Co=256
    set background=dark
    colorscheme molokai 
endif

if has("autocmd")
    " Don't replace tabs with spaces in Makefile
    autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
    " Automatically strip traling whitespace on file save
    autocmd BufWritePre *.css,*.html,*.js,*.json,*.md,*.php,*.py,*.rb,*.scss,*.sh,*.txt :call StripTrailingWhitespace() 
    " Don't treat json as javascript
    autocmd BufRead,BufNewFile *.json set filetype=json
endif

" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>

" Load local machine settings if they exist
if filereadable(glob("$HOME/.vimrc.local"))
	source $HOME/.vimrc.local
endif
