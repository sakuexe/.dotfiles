#!/usr/bin/env bash

error_message="$(fuzzel 2>&1 >/dev/null)"

if [[ $? == 0 ]] then
  # program was found and everything works
  exit 0
fi

# program was not found, use fallback (web search)
failed_command="$(echo $error_message | cut -d ':' -f 4 | xargs)"

# if the prompt is prefixed with g (to make sure the search works)
# remove it, before searching.

# it is there to bypass fuzzel's feature where it tries to run the
# failed command if it starts with something that can be found in
# the user's $PATH (example: "cut in bash" would not work because it
# would be interpeted as cut ...)
prefix="g"
failed_command=$(echo $failed_command | sed "s/^$prefix//i")

# google search in default web browser (remove the whitespaces)
xdg-open https://google.com/search?q=$(echo $failed_command | sed 's/ /+/g')
