 " Initial Set up
set number
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set autoindent
set smartindent
set showmatch
set sw=2
set laststatus =2
set noshowmode
set smartindent
set nowrap
set incsearch
set t_Co=256
set nocompatible
"End Initial Set up

"Plugin Manager
call plug#begin('$HOME/.vim/plugged')

"plugins"
Plug 'franbach/miramare'
Plug 'mhinz/vim-signify'
Plug 'easymotion/vim-easymotion' 
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree'
Plug 'artanikin/vim-synthwave84'
Plug 'arzg/vim-colors-xcode'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
Plug 'sainnhe/sonokai'
Plug 'yuezk/vim-js'
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'
Plug 'vim-syntastic/syntastic'
Plug 'ap/vim-css-color'
Plug 'junegunn/seoul256.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'bagrat/vim-buffet'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"How to fix prettier proble 'nmp install -g prettier'"
"end plugins"

call plug#end()
"End Plugin Manager

"emmet (html func)
let g:user_emmet_mode='a'


"Keys Maps
let mapleader=" " 
nmap <Leader>nt :NERDTreeFind<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <Leader>w :w <CR>
nmap <Leader>q :q <CR>
nmap <Leader>e :e .vimrc<cr> 
nmap <Leader>ho :cd $HOME<cr>
nmap <Leader>py <Plug>(Prettier)
nmap <Leader>pl :PlugInstall<CR>
noremap <Leader>gs :CocSearch 
nnoremap <silent> ba  :bprevious<cr>
nnoremap <silent> bb :bnext<cr>
nnoremap <silent> BA :bfirst<cr>
nnoremap <silent> BB :blast<cr>
nnoremap <silent> VS :vsplit<cr> 
nnoremap <silent> cb :bd<cr>


if &filetype == "javascript" || &filetype == "python"
   inoremap <c-space> <C-x><C-u>
 else
   inoremap <silent><expr> <c-space> coc#refresh()

 endif
"End Keys Maps

"COLORSCHEME
if has('termguicolors')
  set termguicolors
endif
"set background=dark
colorscheme miramare
hi Comment cterm=italic
"color space-vim-dark
"let g:space_vim_dark_background = 233
"End COLORSCHEME

"airline setup
let g:airline_theme='fruit_punch'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep ='▸▸'
let g:airline_left_sep = '»'
let g:airline_left_sep = '»»'
let g:airline_right_sep = '«'
let g:airline_right_sep = '««'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#coc#enabled = 1
function! AccentDemo()
  let keys = ['D','O','O','M',' ','S','L','A', 'Y','E','R']
  for k in keys
    call airline#parts#define_text(k, k)
  endfor
  call airline#parts#define_accent('D', 'red')
  call airline#parts#define_accent('O', 'purple')
  call airline#parts#define_accent('O', 'blue')
  call airline#parts#define_accent('M', 'bold')
  call airline#parts#define_accent(' ', 'orange')
  call airline#parts#define_accent('S', 'purple')
  call airline#parts#define_accent('L', 'bold')
  call airline#parts#define_accent('A', 'red')
  call airline#parts#define_accent('Y', 'purple')
  call airline#parts#define_accent('E', 'green')
  call airline#parts#define_accent('R', 'blue')
  let g:airline_section_a = airline#section#create(keys)

  "let g:airline_section_a = airline#section#create(['mode', ' ' , 'branch'])
endfunction
autocmd VimEnter * call AccentDemo()
"End airline setup


"End COLORSCHEME

"nerd tree configuration
  
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
"autocmd vimenter * NERDTree $Programming
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeQuitOnOpen=1
"end nerd tree configuration



"Prettier setup
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'

"end Prettier setup

"kite setup
let g:kite_supported_languages = ['javascript', 'python']
autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType javascript let b:coc_suggest_disable = 1
autocmd FileType scss setl iskeyword+=@-@
" end kite setup



"Ale configuration and OmniSharp

let g:ale_completion_enabled = 1

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

let g:syntastic_cs_checkers = ['code_checker']



"syntastic settigs
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python']
"end 
