" key mappings
let mapleader = ","
nmap <leader>= :t.\|s/./=/g\|noh<CR>
nmap <leader>- :t.\|s/./-/g\|noh<CR>
nmap <leader>` :%s/<span .*">/```\r/g|%s&</span>&\r```&g<CR>

set number
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
set wildmenu
set lazyredraw
set hlsearch
syntax enable
