autoload -U colors && colors
setopt PROMPT_SUBST

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function parse_git_dirty () {
  [[ -z $(git status --porcelain 2> /dev/null) ]] || echo " *"
}

for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
eval RESET='%{$reset_color%}'

NEWLINE=$'\n'

# PS1="%{$fg[green]%}%n@%M:${fg[cyan]%}%d${fg[red]%}$(parse_git_dirty)${fg[yellow]%}$(parse_git_branch)%{$reset_color%}${NEWLINE}$ "
PS1='${GREEN}%n@%M:${CYAN}%d${RED}$(parse_git_dirty)${YELLOW}$(parse_git_branch)${RESET}${NEWLINE}$ '
