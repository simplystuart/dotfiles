call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'elmcast/elm-vim'
Plug 'ervandew/supertab'
Plug 'vim-ruby/vim-ruby'
call plug#end()

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

" normal mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" silver searcher
if executable('ag')
  set grepprg=ag
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
set ruler
set shiftwidth=2
set smartindent
set splitbelow
set splitright
set t_Co=256
set tabstop=2
set wildmode=longest,list
