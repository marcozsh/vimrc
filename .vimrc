" Initial Set up
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

"End Initial Set up
if has('python3')
endif

"Plugin Manager

call plug#begin('$HOME/.vim/plugged')

"plugins"

"colorschemes
Plug 'franbach/miramare'
Plug 'mhinz/vim-signify'
Plug 'artanikin/vim-synthwave84'
Plug 'arzg/vim-colors-xcode'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'srcery-colors/srcery-vim'
Plug 'rakr/vim-one'
Plug 'sainnhe/sonokai'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'dikiaap/minimalist'
Plug 'sjl/badwolf'
Plug 'heraldofsolace/nisha-vim'
Plug 'yassinebridi/vim-purpura'
Plug 'glepnir/oceanic-material'
Plug 'haystackandroid/carbonized'
Plug 'dracula/vim', { 'as': 'dracula' }

"fonts
Plug 'powerline/fonts'

"editor plugins
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion' 
"Plug 'eslint/eslinbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"jinga syntax (flask, django)
Plug 'glench/vim-jinja2-syntax'

"language plugins
Plug 'sheerun/vim-polyglot'

"html
Plug 'mattn/emmet-vim'
Plug 'othree/html5-syntax.vim'

"css color
Plug 'ap/vim-css-color'

"javascript
Plug 'yuezk/vim-js'

"c#
Plug 'OmniSharp/omnisharp-vim'

"php
Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}

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
"How to fix prettier proble 'npm install -g prettier'"

"Rainbow Parentheses Improved

Plug 'frazrepo/vim-rainbow'

"end plugins"

call plug#end()

"End Plugin Manager



"Rainbow Parentheses Improved configuration

let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"Rainbow Parentheses Improved end configuration

"emmet (html func)

let g:user_emmet_mode='a'

"end emmet

" commenter

let g:NERDCreateDefaultMappings = 1
"comment with <leader> c <space>


"end commenter

"end closetag function

"Keys Maps

let mapleader=" " 
nmap <Leader>nt :NERDTreeFind<CR>
nmap <silent> ga <Plug>(coc-codeaction-line)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <Leader>w :w <CR>
nmap <Leader>q :q <CR>
nmap <Leader>py <Plug>(Prettier)
nmap <Leader>pl :PlugInstall<CR>
nmap <Leader>te :terminal<CR>
noremap <Leader>gs :CocSearch 
nnoremap <silent> ba  :bprevious<cr>
nnoremap <silent> bb :bnext<cr>
nnoremap <silent> cb :bd<cr>
"End Keys Maps

"COLORSCHEME

"set background=dark

colorscheme miramare
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


"nerd tree configuration
  
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeQuitOnOpen=0

"end nerd tree configuration



"Prettier setup
"
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'

"end Prettier setup




"Ale configuration and OmniSharp
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_completion_enabled = 1
let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'javascript' : ['eslint']
\}

let g:syntastic_cs_checkers = ['code_checker']



"syntastic settigs

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python']

"end 

filetype plugin on

let g:nodejs_complete_config = {
\  'js_compl_fn': 'jscomplete#CompleteJS',
\  'max_node_compl_len': 15
\}
