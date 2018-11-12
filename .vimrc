set nocompatible
syntax on
filetype plugin indent on
set shortmess+=I

" Use comma as a leader key
let mapleader=","

" Leader spell-checking
nnoremap <silent> <leader>se :call ToggleSpellLang("en_us")<cr>
nnoremap <silent> <leader>sf :call ToggleSpellLang("fr")<cr>

function! ToggleSpellLang(lang)
  if &spelllang == a:lang
    if &spell
      setlocal nospell
    else
      setlocal spell
    endif
  else
    let &spelllang=a:lang
    setlocal spell
  endif
endfunction


" Replace pattern in multiple files
" Invocation :AllS **/*.h:foo/bar/gc
function! AllS(input)
  let colonIndex = stridx(a:input,':')
  let files = strpart(a:input,0,colonIndex)
  let pattern = strpart(a:input,colonIndex+1)
  execute 'args ' . files
  execute 'silent argdo %' . pattern . 'e | update'
endfunction
:command! -nargs=1 AllS :call AllS(<f-args>)

" Leader highlighted 80th column
nnoremap <silent> <leader>c :call ToggleColorColumn80()<cr>

function! ToggleColorColumn80()
  if &colorcolumn
    setlocal colorcolumn=
  else
    setlocal colorcolumn=80
  endif
endfunction

map <leader>t <C-]>
nnoremap <leader>. :CtrlPTag<cr>

" Leader alternate file
nnoremap <leader>a :FSHere<cr>
nnoremap <C-^> :buffer NERD_tree<cr>

" Turn on line numbers, relatively
set number
set relativenumber

" Insert spaces, not tabs
set expandtab

" Ensure the cursor stays away from the top/bottom
set so=8

" UTF8 or die
set encoding=utf8

" One level of indentation is two spaces
set shiftwidth=2

" Show trailing whitespace
set listchars=tab:›\ ,trail:▒
set list

" Tabs are 4 spaces long
set tabstop=4

if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif

" Default completion type = known words
let g:SuperTabDefaultCompletionType = "<c-x><c-n>"


if !has('gui_running')
  set background=dark
  let g:solarized_termtrans=1
end
colorscheme solarized

" Status line
set laststatus=2

set statusline=%t\      "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}]
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "p
