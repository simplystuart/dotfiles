let g:polyglot_disabled = ['elm']

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'andys8/vim-elm-syntax'
Plug 'chriskempson/base16-vim'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" When writing a buffer (no delay).
call neomake#configure#automake('w')

" airline
let g:airline_extensions = ['coc', 'tabline', 'quickfix']
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_grayscale'

" coc
let g:coc_global_extensions = [
	\ 'coc-deno',
	\ 'coc-elixir',
	\ 'coc-eslint',
	\ 'coc-graphql',
	\ 'coc-json',
	\ 'coc-prettier',
	\ 'coc-tsserver',
	\ 'coc-yaml'
	\ ]

if filereadable(expand("~/.config/nvim/coc.vim"))
	source ~/.config/nvim/coc.vim
endif

" colors
colorscheme base16-default-dark
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

" indenting
filetype plugin indent on

" insert mappings
imap <S-Tab> <C-o>

" margins
set colorcolumn=81

" normal mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" silver searcher
if executable('ag')
	let g:ackprg = 'ag --vimgrep --smart-case'

	cnoreabbrev ag Ack
	cnoreabbrev aG Ack
	cnoreabbrev Ag Ack
	cnoreabbrev AG Ack
endif

" spelling
autocmd BufRead,BufNewFile *.md,*.txt setlocal spell
set complete+=kspell
set spellfile=$HOME/.vim/spell/en.utf-8.add

" syntax highlighting
syntax on

" variables
set autoindent
set backspace=indent,eol,start
set background=dark
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set expandtab
set laststatus=2
set nocompatible
set nohlsearch
set ruler
set shiftwidth=2
set smartindent
set splitbelow
set splitright
set t_Co=256
set tabstop=2
set wildmode=longest,list
