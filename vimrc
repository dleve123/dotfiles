set nocompatible
filetype off

" Vim Plugin Management with Vundle
" ===== START =====
set rtp+=~/dotfiles/vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " Vim package manager
Plugin 'ajh17/Spacegray.vim'    " color scheme
Plugin 'airblade/vim-gitgutter' " display git diff statuses in vim
Plugin 'tpope/vim-surround'     " transform surrounding characters like quotes
Plugin 'tpope/vim-rails'        " shortcuts for operating within Rails projects
Plugin 'tpope/vim-markdown'     " Syntax files for vim - might not be needed??
Plugin 'tpope/vim-fugitive'     " Git binding for vim. Home of the awesome :Gblame
Plugin 'tpope/vim-endwise'      " autocomplete ruby blocks, methods, etc.
Plugin 'tpope/vim-cucumber'     " syntax files for cucumber
Plugin 'vim-ruby/vim-ruby'      " syntax and general support for ruby
Plugin 'ervandew/supertab'      " Autocomplete using <Tab>
Plugin 'scrooloose/nerdtree'    " Filesystem navigator
Plugin 'kien/ctrlp.vim'         " Fuzzy directory explorer
Plugin 'vim-airline/vim-airline'

call vundle#end()
" ===== END =====

" Mapping leader key
let mapleader = ","

" Turning on syntax highlighting.
syntax on
filetype plugin indent on

" Enabling line numbers.
set number

" Colorscheme configuration
colorscheme spacegray

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

" Handle vim temp and backup files
silent !mkdir ~/.vim_tmp > /dev/null 2>&1
silent !mkdir ~/.vim_tmp/backup > /dev/null 2>&1
silent !mkdir ~/.vim_tmp/tmp > /dev/null 2>&1
set backup
set backupdir=~/.vim_tmp/backup
set directory=~/.vim_tmp/tmp

" Force vim to read bash_profile file to be a shell file
au BufNewFile,BufRead bash_profile set syntax=sh
au BufNewFile,BufRead bash_profile set filetype=sh

" Controls visible window area.
set scrolloff=10

" Sets up a statusline - cred: Gary B.
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Enable vim tab completion
set wildmenu

set wildmode=list:longest,list:full

" leader bindings
map <Leader><Space> :noh<CR>
map <Leader>rh xea:f=3x
map <Leader>cp :let @+ = expand("%:p")<CR>

" Display column at 80 character
set colorcolumn=80

" Disabling the arrow keys.
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Remove need for ctrl-w when switching between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remove trailling whitespace on `:w` - cred: Carlos Souza
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType go setlocal noet ts=8 sw=8 sts=8

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
