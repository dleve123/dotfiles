#!/bin/bash

if [ ! -e ~/.vimrc ]; then
  ln -s ~/dotfiles/vimrc ~/.vimrc
fi

# git
if [ ! -e ~/.gitconfig ]; then
  ln -s ~/dotfiles/gitconfig ~/.gitconfig
fi

if [ ! -e ~/.gitignore_global ]; then
  ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
fi

# tmux
if [ ! -e ~/.tmux.conf ]; then
  ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
fi

# ackrc
if [ ! -e ~/.ackrc ]; then
  ln -s ~/dotfiles/ackrc ~/.ackrc
fi

# bashrc
bashgrep=$(grep "source ~/dotfiles/bashrc" ~/.bashrc)
if [ "$bashgrep" != "source ~/dotfiles/bashrc" ]; then
  echo "source ~/dotfiles/bashrc" >> ~/.bashrc
fi

bashgrep=$(grep "source ~/dotfiles/bash_profile" ~/.bash_profile)
if [ "$bashgrep" != "source ~/dotfiles/bash_profile" ]; then
  echo "source ~/dotfiles/bash_profile" >> ~/.bash_profile
fi
