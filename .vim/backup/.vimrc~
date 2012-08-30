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
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Controls visible window area.
set scrolloff=10

" Sets up a statusline - cred: Gary B.
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

set wildmode=list:longest,list:full

" leader remaps
map <Leader>m :BufExplorer<CR>
map <Leader><Space> :noh<CR>

" Rails.vim custom configurations - cred: Eric O.
autocmd User Rails Rnavcommand uploader app/uploaders -suffix=_uploader.rb -default=model()
autocmd User Rails Rnavcommand steps features/step_definitions -suffix=_steps.rb -default=web
autocmd User Rails Rnavcommand blueprint spec/blueprints -suffix=_blueprint.rb -default=model()
autocmd User Rails Rnavcommand factory spec/factories -suffix=_factory.rb -default=model()
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()
autocmd User Rails Rnavcommand feature features -suffix=.feature -default=cucumber
autocmd User Rails Rnavcommand support spec/support features/support -default=env


" Disabling the arrow keys.
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
