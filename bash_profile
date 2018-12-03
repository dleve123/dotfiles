if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

source ~/dotfiles/git-completion.bash
source ~/dotfiles/bashrc

if which rbenv > /dev/null; then
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init -)"
fi

export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/dan/.multirust/toolchains/stable/cargo/bin:$PATH"
