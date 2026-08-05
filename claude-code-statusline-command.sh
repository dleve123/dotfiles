#!/bin/bash

input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir')

parse_git_branch() {
  local branch=$(git -C "$cwd" branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
  echo "$branch"
}

parse_git_dirty() {
  if [[ -n $(git -C "$cwd" --git-dir="$cwd/.git" --work-tree="$cwd" status --porcelain 2> /dev/null) ]]; then
    echo " *"
  fi
}

# Extract model and context window information
model=$(echo "$input" | jq -r '.model.display_name // "unknown"')
context_size=$(echo "$input" | jq -r '.context_window.context_window_size // 0')
pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0')

GREEN='\033[32m'
CYAN='\033[36m'
RED='\033[31m'
YELLOW='\033[33m'
RESET='\033[0m'

if [[ "$pct" -gt 0 ]]; then
  if [[ "$pct" -ge 85 ]]; then
    ctx_color="$RED"
  elif [[ "$pct" -ge 70 ]]; then
    ctx_color="$YELLOW"
  else
    ctx_color="$GREEN"
  fi
  context_display=$(printf " ${ctx_color}[%d%% of %dk]${RESET}" "$pct" $((context_size / 1000)))
else
  context_display=""
fi

username=$(whoami)
hostname=$(hostname -s)
git_dirty=$(parse_git_dirty)
git_branch=$(parse_git_branch)

printf "${GREEN}%s@%s:${CYAN}%s${RED}%s${YELLOW}%s${RESET} %s%s" "$username" "$hostname" "$cwd" "$git_dirty" "$git_branch" "$model" "$context_display"
