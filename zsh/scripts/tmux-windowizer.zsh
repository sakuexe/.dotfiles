# based on the work of ThePrimeagen and his Tmux Sessionizer
# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer

tmux-windowizer () {
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

  selected_dir=$(echo $all_dirs | fzf)

  # early exit if nothing is selected
  if [[ -z $selected_dir ]]; then
    return
  fi

  tmux new-window -c $selected_dir -n $(basename $selected_dir)
}

bindkey -s "^f" "tmux-windowizer\n"
