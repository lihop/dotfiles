{}:
{
  config = ''
    set nocompatible              " be iMproved, required
    filetype off                  " required
    filetype plugin indent on     " required

    if has("syntax")
        "Enable syntax highlighting
        syntax enable
        " Set 256 color terminal support
        set t_Co=256
        " Pseudo-randomly  load a color scheme every time vim starts
        colorscheme random
    endif

    function StripTrailingWhitespace()
        if !&binary && &filetype != 'diff'
          normal mz
          normal Hmy
          %s/\s\+$//e
          normal 'yz<CR>
          normal `z
        endif
    endfunction

    if has("autocmd")
        " Don't replace tabs with spaces in Makefile
        autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
        " Automatically strip traling whitespace on file save
        autocmd BufWritePre *.css,*.html,*.js,*.json,*.md,*.php,*.py,*.rb,*.scss,*.sh,*.txt,*.elm,*.hs,*.cabal,*.nix :call StripTrailingWhitespace()
        " Don't treat json as javascript
        autocmd BufRead,BufNewFile *.json set filetype=json
    endif

    " LaTeX (rubber) macro for compiling
    nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>

    " View PDF macro; '%:r' is current file's root (base) name.
    nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>

    " vim-latex-live-preview use mupdf as previewer
    let g:livepreview_previewer = 'mupdf-x11'

    " Load local machine settings if they exist
    if filereadable(glob("$HOME/.vimrc.local"))
    	source $HOME/.vimrc.local
    endif

   set colorcolumn=81
   set ruler
  '';
}
