#!/usr/bin/env bash

set -e # exit on error

RED="\e[31m"
GREEN="\e[32m"
CLEAR="\e[0m"
VIOLET="\033[38;5;183m"

# gitpub - git publish
# adds all changes, commits them with a message, and pushes to remote
COMMIT_MSG=$1

# get the root path to current git project
GIT_ROOT=$(git rev-parse --show-toplevel)

# initial refresh and removing all cached files
git --git-dir="$GIT_ROOT" rm -r --cached "$GIT_ROOT" > /dev/null 2>&1 || true

# add all changes to the next commit
git add -A

# commit, take arguments, or ask for commit message
if ! [ -z "$COMMIT_MSG" ]
then
  git commit -m "$COMMIT_MSG"
else
  git commit
fi

REMOTES=$(git remote)
REMOTE_COUNT=$(echo "$REMOTES" | grep -c .)
DEFAULT_REMOTE=$(git remote | head -n 1)

if [ "$REMOTE_COUNT" -le 1 ]; then
  REMOTE=$DEFAULT_REMOTE
else
  REMOTE=$(echo "$REMOTES" | sed "s/^${DEFAULT_REMOTE}\$/${DEFAULT_REMOTE} (current)/" \
    | fzf --prompt="Remote> " --height=~40% --layout=reverse --border \
          --header="Default: ${DEFAULT_REMOTE}" --query="$DEFAULT_REMOTE" --select-1 --exit-0)
  REMOTE=$(echo "$REMOTE" | sed 's/ (current)$//')
  REMOTE=${REMOTE:-$DEFAULT_REMOTE}
fi
printf "Using remote: ${VIOLET}%s${CLEAR}\n" "$REMOTE"

BRANCHES=$(git branch --format='%(refname:short)')
BRANCH_COUNT=$(echo "$BRANCHES" | grep -c .)
DEFAULT_BRANCH=$(git branch --show-current)

if [ "$BRANCH_COUNT" -le 1 ]; then
  BRANCH=$DEFAULT_BRANCH
else
  BRANCH=$(echo "$BRANCHES" | sed "s/^${DEFAULT_BRANCH}\$/${DEFAULT_BRANCH} (current)/" \
    | fzf --prompt="Branch> " --height=~40% --layout=reverse --border \
          --header="Default: ${DEFAULT_BRANCH}" --query="$DEFAULT_BRANCH") || true
  BRANCH=$(echo "$BRANCH" | sed 's/ (current)$//')
  BRANCH=${BRANCH:-$DEFAULT_BRANCH}
fi
printf "Using branch: ${VIOLET}%s${CLEAR}\n" "$BRANCH"

# push to remote
git push $REMOTE $BRANCH
echo -e "${GREEN}Pushed succesfully to $REMOTE/$BRANCH.${CLEAR}"
