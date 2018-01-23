" key mappings
let mapleader = ","
nmap <leader>= :t.\|s/./=/g\|noh<CR>
nmap <leader>- :t.\|s/./-/g\|noh<CR>
nmap <leader>` :%s/<pre .*">/```\r/g\|%s&</pre>&\r```&g<CR>
nmap <leader>d :%s/<div>//g\|%s&</div>&&g<CR>

set number
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
set wildmenu
set lazyredraw
set hlsearch
set ignorecase

syntax enable

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Ds call s:DiffWithSaved()
