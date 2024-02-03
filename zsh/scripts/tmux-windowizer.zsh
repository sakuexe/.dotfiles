# based on the work of ThePrimeagen and his Tmux Sessionizer
# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer

tmux-windowizer () {
  # check if fzf is installed
  if ! command -v fzf &> /dev/null; then
    echo "fzf is not installed"
    exit 1
  fi
  selected_dir=$(find ~/code ~/Downloads -mindepth 1 -maxdepth 1 -type d | fzf)

  # early exit if nothing is selected
  if [[ -z $selected_dir ]]; then
    exit 0
  fi

  tmux new-window -c $selected_dir -n $(basename $selected_dir)
}

bindkey -s "^f" "tmux-windowizer\n"
