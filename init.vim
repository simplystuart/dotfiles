call plug#begin('~/.local/share/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'elmcast/elm-vim'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'tikhomirov/vim-glsl'
Plug 'w0rp/ale'
Plug 'vim-ruby/vim-ruby'
call plug#end()

" When writing a buffer (no delay).
call neomake#configure#automake('w')

" ale
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'javascript': ['prettier'],
\   'markdown': ['prettier'],
\}

let g:ale_lint_delay = 1000
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" colors
colorscheme base16-default-dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" elm
let g:elm_format_autosave = 1

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
set spellfile=$HOME/.vim/.vim-spell-en.utf-8.add

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
