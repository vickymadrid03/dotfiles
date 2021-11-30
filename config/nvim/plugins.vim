if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  " Thanks to https://www.chrisatmachine.com/Neovim/01-vim-plug/
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

" Tree explorer
Plug 'preservim/nerdtree'

" Add icons
Plug 'ryanoasis/vim-devicons'

" Color theme
Plug 'mhartington/oceanic-next'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Language Syntax Highlighting
Plug 'sheerun/vim-polyglot'

" For Languages Support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Trailing spaces
Plug 'ntpeters/vim-better-whitespace'

" Indent guidelines
Plug 'Yggdroot/indentLine'

" For commenting easily
Plug 'tpope/vim-commentary'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

let mapleader = ","

" Plugin NERDTree
"""""""""""""""""""""""""""""""

" Toggle NERDTree with Ctrl + b
nmap <C-b> :NERDTreeToggle<CR>
" Exit nvim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Colortheme
""""""""""""""""""""""""""""""
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
" Set OceanicNext as colortheme
colorscheme OceanicNext

" Plugin Vim Airline
""""""""""""""""""""""""""""""""
" Show buffer number on the top of the window tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Plugin FZF.vim
""""""""""""""""""""""""""""""""
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Requires silversearcher-ag, used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" FZF, do not include filenames in Full Search, but keep the preview
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" FZF Mappings
""""""""""""""""""""""""""""""""
" FZF, Search buffers
nnoremap <silent> <Leader>b :Buffers<CR>
" FZF, File Searching with <leader> + p
nnoremap <leader>p :Files<CR>
" FZF, Full Searching with <leader> + f
nnoremap <silent> <Leader>f :Ag<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

set grepprg=ag\ --vimgrep\ --smart-case\ --follow

" Plugin indentLine
""""""""""""""""""""""""""""""
let g:indentLine_char = '|'

" Plugin vim-commentary
""""""""""""""""""""""""""""""
" Comment with <space> + /
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" Plugin coc.nvim
"""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-css', 'coc-elixir', 'coc-emmet', 'coc-eslint', 'coc-html', 'coc-json', 'coc-solargraph']

" <leader> + dd  - Jump to definition of current symbol
" <leader> + dr  - Jump to references of current symbol
" <leader> + dj  - Jump to implementation of current symbol
" <leader> + ds  - Fuzzy search current project symbols
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
nnoremap <silent> <leader>ds :<C-u>CocList -I -N --top symbols<CR>

" For scss files - coc-scss
autocmd FileType scss setl iskeyword+=@-@

" Plugin Vim Better Whitespace
""""""""""""""""""""""""""""""""
" Confirm before removing trailing spaces
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=1

