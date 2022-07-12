#!/bin/bash

# vimrc
if [ ! -e ~/.vimrc ]; then
  ln -s ~/dotfiles/vimrc ~/.vimrc
fi

# git config
if [ ! -e ~/.gitconfig ]; then
  ln -s ~/dotfiles/gitconfig ~/.gitconfig
fi

# git global ignore
if [ ! -e ~/.gitignore_global ]; then
  ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
fi

# tmux
if [ ! -e ~/.tmux.conf ]; then
  ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
fi

# inputrc
if [ ! -e ~/.inputrc ]; then
  ln -s ~/dotfiles/inputrc ~/.inputrc
fi

# editrc
if [ ! -e ~/.editrc ]; then
  ln -s ~/dotfiles/editrc ~/.editrc
fi

# zshrc
if ! ( [ -e ~/.zshrc ] && grep -q "source ~/dotfiles/zshrc" ~/.zshrc ); then
  echo "source ~/dotfiles/zshrc" >> ~/.zshrc
fi

# laptop.local
# if [ ! -e ~/.laptop.local ]; then
#   ln -s ~/dotfiles/laptop.local ~/.laptop.local
# fi

# Install vim package manager
if ! [ -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install vim plugins from vim
echo '!!! Manual Step: vim; :VundleInstall'
