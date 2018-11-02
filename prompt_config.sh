function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function parse_git_dirty () {
  [[ -z $(git status --porcelain 2> /dev/null) ]] || echo "*"
}

CYAN="\[\033[0;36m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
RED="\[\033[0;31m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u@\h:$CYAN\w $RED\$(parse_git_dirty)$YELLOW\$(parse_git_branch)$NO_COLOUR\n\$ "
