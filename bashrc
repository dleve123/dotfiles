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
alias print_path="echo $PATH | tr -s ':' '\n'"
alias gpg="gpg2"

alias be="bundle exec"

# PostgreSQL
alias pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log"

alias git-delete-merged="git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d" # remove local tracking branches of branches merged upstream

# Java aliases
alias javac="javac -Xlint:all"
alias java="java -ea"
alias compileTests="javac -cp junit-4.11.jar:."
alias runTests="java -cp junit-4.11.jar:. org.junit.runner.JUnitCore"
alias checkStyle="java -jar checkstyle-5.7-all.jar -c jhu_checks.xml"

# TODO: Configure readline to use vi-style keybindings.
set -o vi

export PATH="$HOME/bin:$PATH"

# Configure gpg2 to use the current TTY
export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias artsy_gh_compare='hokusai pipeline gitcompare --org-name artsy'

source ~/dotfiles/homebrew_autocomplete.sh
source ~/dotfiles/prompt_config.sh
