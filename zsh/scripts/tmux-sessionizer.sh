# based on the work of ThePrimeagen and his Tmux Sessionizer
# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer

tmux-sessionizer () {
  # check if fzf is installed
  if ! command -v fzf &> /dev/null; then
    echo "fzf is not installed"
    return
  fi

  # get all the dirs inside the specified dirs
  # also suppress the error messages (so it doesn't matter if all the folders are present)
  all_dirs=$(find ~/Code ~/Nixos -maxdepth 1 -type d 2>/dev/null)

  if [[ -z $all_dirs ]]; then
    echo "No specified directories (~/Code, ~/Nixos) were found"
    return
  fi

  selected_dir=$(echo $all_dirs | fzf --preview "ls -laFh {}")
  selected_name=$(basename $selected_dir)
  tmux_running=$(pgrep tmux)

  # early exit if nothing is selected
  if [[ -z $selected_dir ]]; then
    return
  fi

  # if tmux is not already running, create a new session and attach it
  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected_dir 
    return
  fi

  # if the session with the selected name does NOT exist,
  # create a new session with the name WITHOUT attaching it
  if ! tmux-has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected_dir 
  fi

  # attach to the chosen session
  tmux switch-client -t $selected_name
}

# ctrl-f keybind
bindkey -s "^f" "tmux-sessionizer\n"
