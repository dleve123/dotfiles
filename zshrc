autoload -Uz compinit && compinit

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
alias current_public_ip="dig +short myip.opendns.com @resolver1.opendns.com"

# tmux aliases
alias t="tmux"
alias ta="tmux attach -t"

# PostgreSQL
alias pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log"

alias git-delete-merged="git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d" # remove local tracking branches of branches merged upstream

# TODO: Configure readline to use vi-style keybindings.
set -o vi

export PATH="$HOME/bin:$PATH"

# Configure gpg2 to use the current TTY
export GPG_TTY=$(tty)

source ~/dotfiles/zsh_prompt_config.sh
