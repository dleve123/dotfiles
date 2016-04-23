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

# Healthify aliases
## Navigation aliases
alias h='cd ~/code/healthify'
alias hh='cd ~/code/healthify/healthify'

## Console aliases
alias hfy_prod_console='aptible ssh bundle exec rails console --app healthify-production'
alias hfy_staging_console='aptible ssh bundle exec rails console --app newstg-rails'

## Deployment aliases
alias hfy_deploy_prod='git push production production:master'

# TODO: Configure readline to use vi-style keybindings.
set -o vi

export PATH="$HOME/bin:$PATH"

source ~/dotfiles/prompt_config.sh
