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

# bashrc
if ! ( [ -e ~/.bashrc ] && grep -q "source ~/dotfiles/bashrc" ~/.bashrc ); then
  echo "source ~/dotfiles/bashrc" >> ~/.bashrc
fi

# bash_profile
if ! ( [ -e ~/.bash_profile ] && grep -q "source ~/dotfiles/bash_profile" ~/.bash_profile ); then
  echo "source ~/dotfiles/bash_profile" >> ~/.bash_profile
fi

# laptop.local
if [ ! -e ~/.laptop.local ]; then
  ln -s ~/dotfiles/laptop.local ~/.laptop.local
fi

# Clone down Vundle
# :VundleInstall within vim to install git plugins to ~/.vim/bundle
