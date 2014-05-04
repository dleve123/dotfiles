# Vim errywhere
export EDITOR=vi

# Useful bash command aliases
alias ls="ls -G"
alias ll="ls -al"
alias l.="ls -d .*"
alias svim="sudo vim"
alias rake="bundle exec rake"
alias cucumber="bundle exec cucumber"
alias rspec="rspec --color"

# todo.txt alias
alias todo="todo.sh -d /usr/local/Cellar/todo-txt/2.10/todo.cfg"
alias t=todo

# PostgreSQL
alias pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log"

# Git macros
alias git-delete-merged="git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"

# Java aliases
alias javac="javac -Xlint:all"
alias java="java -ea"
alias compileTests="javac -cp junit-4.11.jar:."
alias runTests="java -cp junit-4.11.jar:. org.junit.runner.JUnitCore"
alias checkStyle="java -jar checkstyle-5.7-all.jar -c jhu_checks.xml"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

set -o vi

# Prompt Set Up
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
CYAN="\[\033[0;36m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u@\h:$CYAN\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "
