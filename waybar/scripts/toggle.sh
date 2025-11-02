#!/usr/bin/env bash

# Toggles a window, if it is already open, it will be closed.
# Depends on jq and hyprctl, since those are always installed on my machines.
# usage : toggle.sh <window class> (<pkill name>)

CLASS=$1
PKILL_NAME=$2

hyprctl clients -j | jq -e "map(select(.class | match(\"$CLASS\"))) | length > 0"

if [[ $? -ne 0 ]]; then
  # hyprctl notify -1 2000 "rgb(ff1ea3)" "Opening $CLASS"
  hyprctl dispatch exec $CLASS
  exit 0
fi

# hyprctl notify -1 2000 "rgb(ff1ea3)" "Window $CLASS already open"
if [[ -n $PKILL_NAME ]]; then
  pkill $PKILL_NAME
else
  pkill $CLASS
fi
