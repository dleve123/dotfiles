set nocompatible
filetype off

" Vim Plugin Management with Vundle
" ===== START =====
set rtp+=~/dotfiles/vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ajh17/Spacegray.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ervandew/supertab'

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
silent !mkdir ~/.vim_workplace > /dev/null 2>&1
silent !mkdir ~/.vim_workplace/backup > /dev/null 2>&1
silent !mkdir ~/.vim_workplace/tmp > /dev/null 2>&1
set backup
set backupdir=~/.vim_workplace/backup
set directory=~/.vim_workplace/tmp

" Place .viminfo file in .vim_workplace
set viminfo+=n~/.vim_workplace/.viminfo

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

" Disabling the arrow keys.
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Remove trailling whitespace on `:w` - cred: Carlos Souza
autocmd BufWritePre * :%s/\s\+$//e

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
" cred: Gary Bernhardt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>
