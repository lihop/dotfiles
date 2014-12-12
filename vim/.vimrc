execute pathogen#infect()

syntax on
filetype plugin indent on

" FILE SPECIFC 

" Makefile
    " Don't replace tabs with spaces
    autocmd FileType make setlocal noexpandtab 

" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>
