syntax on
set number
set numberwidth=1
set clipboard=unnamed
set encoding=utf-8
set autoindent
set smartindent
set showmatch
set laststatus =2
set noshowmode
set smartindent
set nowrap
set incsearch
set t_Co=256
set nocompatible
set relativenumber

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'yggdroot/indentline'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'powerline/fonts'
  Plug 'frazrepo/vim-rainbow'
  Plug 'ap/vim-css-color'
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
  Plug 'neomake/neomake'
  Plug 'arzg/vim-colors-xcode'
  Plug 'sts10/vim-pink-moon'
call plug#end()


let mapleader=" " 
nmap <Leader>nt :NERDTreeFind<CR>
nnoremap <silent> ba  :bprevious<cr>
nnoremap <silent> bb :bnext<cr>
nnoremap <silent> cb :bd<cr>

set termguicolors
colorscheme pink-moon
set background=dark


let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeQuitOnOpen=0
let g:NERDTreeWinPos = "right"

"airline setup

let g:airline_theme='kolor'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#coc#enabled = 0 
let g:airline#extensions#whitespace#enabled = 0
function! AccentDemo()
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_b = airline#section#create(['',' ','filetype'])
  let g:airline_section_c = airline#section#create(['branch'])
  let g:airline_section_z = airline#section#create([' ','%f'])
  let g:airline_section_y = airline#section#create([' ','%p'])
  
  let keys = ['m','a','r','c','o','z','s','h']
    for k in keys
      call airline#parts#define_text(k, k)
    endfor
    call airline#parts#define_accent('m', 'red')
    call airline#parts#define_accent('a', 'green')
    call airline#parts#define_accent('r', 'blue')
    call airline#parts#define_accent('c', 'yellow')
    call airline#parts#define_accent('o', 'orange')
    call airline#parts#define_accent('z', 'purple')
    call airline#parts#define_accent('s', 'red')
    call airline#parts#define_accent('h', 'blue')
  let g:airline_section_x= airline#section#create(keys)
endfunction
autocmd VimEnter * call AccentDemo()

"End airline setup

call neomake#configure#automake('nrwi', 500)
