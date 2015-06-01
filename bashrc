# Vim errywhere
export EDITOR=vi

# ls aliases
alias ls="ls -G"
alias ll="ls -al"
alias l.="ls -d .*"

# cd aliases
alias ..='cd ..'
alias ...='cd ../..'

# Misc aliases
alias tailf="tail -f"
alias svim="sudo vim"

# Ruby aliases
alias rake="bundle exec rake"
alias cucumber="bundle exec cucumber"
alias rspec="bundle exec rspec --color"

# todo.txt
alias todo="todo.sh -d ~/.todo.cfg"
alias t=todo

# PostgreSQL
alias pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log"

# Git
alias git-delete-merged="git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"

function git-new-remote-tracking {
  git checkout -b $1 && git push -u origin $1
}

# Java aliases
alias javac="javac -Xlint:all"
alias java="java -ea"
alias compileTests="javac -cp junit-4.11.jar:."
alias runTests="java -cp junit-4.11.jar:. org.junit.runner.JUnitCore"
alias checkStyle="java -jar checkstyle-5.7-all.jar -c jhu_checks.xml"

# Healthify aliases
## Navigation aliases
alias h='cd ~/code/healthify'
alias hh='cd ~/code/healthify/healthify'

## Console aliases
alias hfy_prod_console='aptible ssh bundle exec rails console --app healthify-production'
alias hfy_staging_console='aptible ssh bundle exec rails console'

# Path alterations
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

set -o vi

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function parse_pwd () {
  if [ ! -d .git ]; then
    pwd
  else
    echo "${PWD##*/}"
  fi
}


RED="\[\033[0;31m\]"
CYAN="\[\033[0;36m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u@\h:$CYAN\$(parse_pwd)$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

export PATH="$HOME/.bin:$PATH"
eval "$(rbenv init - --no-rehash bash)"
