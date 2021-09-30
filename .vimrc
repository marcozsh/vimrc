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

"colorschemes
Plug 'franbach/miramare'
Plug 'mhinz/vim-signify'
Plug 'artanikin/vim-synthwave84'
Plug 'arzg/vim-colors-xcode'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'rakr/vim-one'
Plug 'sainnhe/sonokai'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'kyoz/purify', { 'rtp': 'vim' }

"fonts
Plug 'powerline/fonts'

"editor plugins
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion' 

"bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"language plugins
Plug 'sheerun/vim-polyglot'

"html
Plug 'mattn/emmet-vim'

"css color
Plug 'ap/vim-css-color'

"javascript
Plug 'yuezk/vim-js'

"c#
Plug 'OmniSharp/omnisharp-vim'

"syntax checker
Plug 'dense-analysis/ale'

"git
Plug 'tpope/vim-fugitive'

"typing
Plug 'jiangmiao/auto-pairs'


"commentFunction
Plug 'scrooloose/nerdcommenter'

"vim prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"How to fix prettier proble 'nmp install -g prettier'"

"end plugins"

call plug#end()

"End Plugin Manager

"emmet (html func)

let g:user_emmet_mode='a'

"end emmet

" commenter

let g:NERDCreateDefaultMappings = 1

"end commenter

"end closetag function

"Keys Maps

let mapleader=" " 
nmap <Leader>nt :NERDTreeFind<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <Leader>w :w <CR>
nmap <Leader>q :q <CR>
nmap <Leader>py <Plug>(Prettier)
nmap <Leader>pl :PlugInstall<CR>
noremap <Leader>gs :CocSearch 
nnoremap <silent> ba  :bprevious<cr>
nnoremap <silent> bb :bnext<cr>
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
set background=dark
colorscheme miramare
hi Comment cterm=italic

"End COLORSCHEME

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
  let g:airline_section_z = airline#section#create(['','%f'])
  let g:airline_section_y = airline#section#create(['','%p'])
  
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


"End COLORSCHEME

"nerd tree configuration
  
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeQuitOnOpen=1

"end nerd tree configuration



"Prettier setup
"
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
