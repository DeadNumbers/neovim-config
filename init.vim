call plug#begin('~/.config/nvim/pluggied')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
Plug 'nsf/gocode', { 'branch': 'master', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/deoplete-go'

Plug 'https://github.com/rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Plug 'https://github.com/vim-scripts/AutoClose'
Plug 'https://github.com/vim-scripts/PKGBUILD'

" Airline
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scwood/vim-hybrid'

call plug#end()

if strftime("%H") > 18
  colorscheme hybrid
else
  colorscheme hybrid-light "Tomorrow-Night
endif

set smartindent
set encoding=utf-8
set smartcase
set number
set noswapfile


let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#gocode_binary = '/home/user/go/bin/gocode'
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog  = '/bin/python'

filetype plugin indent on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Current line number
map <F2> :echo line(".") + 1<cr>

" Scroll
set scrolloff=10
nnoremap <silent><expr> j line('w$') - line('.') < 10 ? "j<C-e>" : "j"

" Sudo write
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Airline conf
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='sol'
let g:airline_powerline_fonts = 1

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <F4> :NERDTreeToggle<CR>

" Key
map <C-w> :tabclose<CR>
map <C-n> :tabnew<CR>
map <C-Tab> :tabnext<CR>


