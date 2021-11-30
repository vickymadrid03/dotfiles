" Set leader key
let mapleader = ","

set encoding=UTF-8                            " Neovim sets it by default, but wanted to be explicit
set ignorecase                                " Ignore case when searching
set smartcase                                 " Search is case sensitive if the search has an upper case letter in it
set autoread                                  " Automatically re-read file if a change was detected outside of vim
set number relativenumber                     " Enable hybrid relative line numbers
set splitright                                " Open new vertical split panes to right
set splitbelow                                " Open new horizontal split panes to below

" TAB/Space settings
"""""""""""""""""""""""""""""""
set expandtab                                 " Insert spaces when TAB is pressed.
set softtabstop=2                             " Number of spaces per TAB
set nowrap                                    " Do not wrap long lines by default
set cursorline                                " Enable highlighting of the current line

" Delete current buffer with <leader> + d
nmap <leader>d :bd<CR>

" Integrated terminal
""""""""""""""""""""""""""""""""
" Turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
" Open terminal with <leader> + n
nnoremap <leader>n :call OpenTerminal()<CR>

" Move between split/vsplit panels with Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
