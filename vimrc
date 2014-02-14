set nocompatible

" Enabling syntax highlighting.
call pathogen#infect()
call pathogen#helptags()


" Mapping leader key
let mapleader = ","

" Turning on syntax highlighting.
syntax on
filetype off
filetype plugin indent on

" Setting up background with solarized.
set t_Co=256
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

" Enabling line numbers.
set number

" Setting up search setttings.
set incsearch
set hlsearch

" Setting up tab settings.
set list
set listchars=tab:»·,trail:·

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Handles vim temp and backup files
silent !mkdir ~/.vim_workplace > /dev/null 2>&1
silent !mkdir ~/.vim_workplace/backup > /dev/null 2>&1
silent !mkdir ~/.vim_workplace/tmp > /dev/null 2>&1
set backup
set backupdir=~/.vim_workplace/backup
set directory=~/.vim_workplace/tmp

" Place .viminfo file in .vim_workplace
set viminfo+=n~/.vim_workplace/.viminfo

" Controls visible window area.
set scrolloff=10

" Sets up a statusline - cred: Gary B.
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

set wildmode=list:longest,list:full

" leader remaps
map <Leader>m :BufExplorer<CR>
map <Leader><Space> :noh<CR>

" Disabling the arrow keys.
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Auto format cucumber tables using Tabularize - cred: T. Pope
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
