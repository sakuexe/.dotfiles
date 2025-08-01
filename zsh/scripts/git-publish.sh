#!/usr/bin/env bash

set -e # exit on error

RED="\e[31m"
GREEN="\e[32m"
CLEAR="\e[0m"

# gitpub - git publish
# adds all changes, commits them with a message, and pushes to remote
COMMIT_MSG=$1
DEFAULT_REMOTE=`git remote | head -n 1`
DEFAULT_BRANCH=`git branch --show-current`

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

REMOTES=`git remote | tr -d '\n'`
echo -n "Give remote. (* $REMOTES): "
read REMOTE
# if REMOTE is empty, set it to origin (the default)
if [ -z "$REMOTE" ]
then
  REMOTE=$DEFAULT_REMOTE
fi

BRANCHES=`git branch | tr -d '\n'`
echo -n "Give branch. ($BRANCHES): "
read BRANCH
# if BRANCH is empty, set it to master (the default)
if [ -z "$BRANCH" ]
then
  BRANCH=$DEFAULT_BRANCH
fi

# push to remote
git push $REMOTE $BRANCH
echo -e "${GREEN}Pushed succesfully to $REMOTE/$BRANCH.${CLEAR}"
