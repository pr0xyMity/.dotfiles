syntax on

set guicursor=
set showmatch
set relativenumber
set nohlsearch
"set noshowmode
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=10
set shortmess+=c
set updatetime=100

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdcommenter'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'alvan/vim-closetag'
Plug 'leafoftree/vim-vue-plugin'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'scss', 'vue', 'json', 'yaml'] }
Plug 'mattn/emmet-vim'

Plug 'mhinz/vim-rfc'
Plug 'junegunn/goyo.vim'
Plug 'voldikss/vim-floaterm'
Plug 'ervandew/supertab'
call plug#end()

set encoding=UTF-8


" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Airline
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Language Client
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" Coc Extentions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-tslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-vetur',
  \ 'coc-emmet',
  \ 'coc-swagger',
  \ 'coc-css',
  \ ]

" Close tag with '>'
let g:closetag_filenames = '*.vue'

" Commenting NERDCommenter
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction

function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" Vim Vue Plugin
let g:vim_vue_plugin_use_scss = 1
let g:vim_vue_plugin_highlight_vue_attr = 1
let g:vim_vue_plugin_highlight_vue_keyword = 1

" Color scheme
"colorscheme gruvbox
colorscheme onedark

" Transparent background
highlight Normal guibg=none

let mapleader = " "
let g:vue_pre_processors =  ['scss']

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" Goyo config
let g:goyo_width = '50%'
let g:goyo_height = '90%'

" Float term
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<leader>tt'

" NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" Goyo
nmap <leader>gg :Goyo<CR>

" Movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>d :bnext<CR>
nnoremap <leader>a :bprevious<CR>
nnoremap <leader>w :bwipe<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>= <C-w>=

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

nnoremap <Leader>ps :Rg<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>+ :vertical resize +15<CR>
nnoremap <Leader>- :vertical resize -15<CR>

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leade>rr <Plug>(coc-rename)
nnoremap <leader>cr :CocRestart

" Use <TAB> to navigate through hints menu
" inoremap <silent><expr> <TAB>
            " \ pumvisible() ? "\<C-n>" :
            " \ <SID>check_back_space() ? "\<TAB>" :
            " \ coc#refresh()

" function! s:check_back_space() abort
    " let col = col('.') - 1
    " return !col || getline('.')[col - 1]  =~# '\s'
" endfunction


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
