#!/usr/bin/env bash

set -e # exit on error

# TODO: research freezing screen during 
# screenshot region picking

SELECTION_COLOR="C778DD0D"
BACKGROUND_COLOR="1B1F28CC"
BORDER_COLOR="E06B74ff"

function region() {
  grim -g \
    "$(slurp -b $BACKGROUND_COLOR -c $BORDER_COLOR -s $SELECTION_COLOR -w 0)" - \
    | satty --filename - \
    --output-filename ~/Pictures/Screenshots/screenshot-$(date '+%Y%m%d_%H%M%S').png \
    --early-exit \
    --initial-tool brush \
    --disable-notifications \
    --actions-on-escape save-to-clipboard \
    --copy-command wl-copy
}

function fullscreen() {
  grim -o "$(hyprctl monitors | awk '/Monitor/{mon=$2} /focused: yes/{print mon}')" - \
    | satty --filename - \
    --fullscreen \
    --output-filename ~/Pictures/Screenshots/screenshot-$(date '+%Y%m%d_%H%M%S').png \
    --early-exit \
    --initial-tool brush \
    --disable-notifications \
    --actions-on-escape save-to-clipboard \
    --copy-command wl-copy
}

if [[ $1 == "" ]]; then
  echo "screenshots.sh usage: screenshots.sh <region || fullscreen>"
  exit 1
fi

if [[ $1 == "region" ]]; then
  region
  exit 0
fi

if [[ $1 == "fullscreen" ]]; then
  fullscreen
  exit 0
fi

echo "no valid mode was given (region || fullscreen)"
exit 1
