PATH=/usr/local/bin:$PATH

source ~/dotfiles/git-completion.bash
source ~/dotfiles/bashrc

if which rbenv > /dev/null; then
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init -)"
fi
