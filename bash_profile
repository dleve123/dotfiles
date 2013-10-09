PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias ls="ls -G"
alias svim="sudo vim"
alias rake="bundle exec rake"
alias cucumber="bundle exec cucumber"
alias rspec="rspec --color"

export EDITOR=vim

source ~/dotfiles/git-completion.bash

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
CYAN="\[\033[0;36m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u@\h:$CYAN\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "
