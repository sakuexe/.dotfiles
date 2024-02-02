navigate () {
  cd $(find ~/code ~/Downloads -maxdepth 1 -type d | fzf)
}

bindkey -s "^f" "navigate\n"
