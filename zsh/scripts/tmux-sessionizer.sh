#!/usr/bin/env bash

set -e

# based on the work of ThePrimeagen and his tmux_sessionizer.sh
# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer

# check if fzf is installed
if ! command -v fzf &> /dev/null; then
  echo "fzf is not installed"
  exit 0
fi

# get all the dirs inside the specified dirs
# missing folders are reported in the fzf header, but do not stop the script
search_dirs=(~/Code ~/Nixos)
existing_dirs=()
warnings=""
for dir in "${search_dirs[@]}"; do
  if [[ -d $dir ]]; then
    existing_dirs+=("$dir")
  else
    warnings+="not found: $dir"$'\n'
  fi
done

if [[ ${#existing_dirs[@]} -eq 0 ]]; then
  echo "None of the specified directories (~/Code, ~/Nixos) were found"
  read -n 1 -s -r -p "press any key to close"
  exit 0
fi

all_dirs=$(find "${existing_dirs[@]}" -maxdepth 1 -type d)

selected_dir=$(printf '%s\n' "$all_dirs" | fzf --preview "ls -laFh {}" ${warnings:+--header "$warnings"})
selected_name=$(basename $selected_dir)
tmux_running=$(pgrep tmux)

# early exit if nothing is selected
if [[ -z $selected_dir ]]; then
  exit 0
fi

# if tmux is not already running, create a new session and attach it
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s $selected_name -c $selected_dir 
  exit 0
fi

# if the session with the selected name does NOT exist,
# create a new session with the name WITHOUT attaching it
if ! tmux has-session -t=$selected_name; then
  tmux new-session -ds $selected_name -c $selected_dir
  tmux send-keys -t "$selected_name" 'activate_dev_flake' C-m 2> /dev/null
fi

# attach to the chosen session, since it already exists
tmux switch-client -t $selected_name
