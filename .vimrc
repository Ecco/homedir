set nocompatible
syntax on
filetype plugin indent on
set shortmess+=I

" Insert spaces, not tabs
set expandtab

" One level of indentation is two spaces
set shiftwidth=2

if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif

" Default completion type = known words
let g:SuperTabDefaultCompletionType = "<c-n>"

