#!/usr/bin/env bash

# open the remote in the default browser (quietly and in the background)
gitopen() {
  remoteurl=$(git remote get-url origin)
  if [[ $remoteurl == "" ]] then
    echo "Could not get remote url for remote 'origin'"
    exit 1
  fi

  # if the remote is done over https
  if [[ "$remoteurl" == https* ]] then
    git remote get-url origin | xargs xdg-open
    exit 0
  fi

  # if the remote is done over ssh
  git remote get-url origin | sed 's/.*:/https:\/\/github.com\//' | xargs xdg-open
}
