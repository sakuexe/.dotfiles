#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
CLEAR="\e[0m"

# gitpub - git publish
# adds all changes, commits them with a message, and pushes to remote
gitpub () {

  COMMIT_MSG=$1
  DEFAULT_REMOTE=`git remote | head -n 1`
  DEFAULT_BRANCH=`git branch --show-current`

  # get the root path to current git project
  GIT_ROOT=$(git rev-parse --show-toplevel)

  # initial refresh and removing all cached files
  git --git-dir="$GIT_ROOT" rm -r --cached $GIT_ROOT > /dev/null 2>&1  # remove all files from being tracked

  # add all changes to the next commit
  git add -A

  # commit, take arguments, or ask for commit message
  if ! [ -z "$COMMIT_MSG" ]
  then
    git commit -m "$COMMIT_MSG"
  else
    git commit
  fi

  # catch the exit code of the commit
  if [ $? -ne 0 ]
  then
    echo -e "${RED}No commit message passed, exiting.${CLEAR}"
    return
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

  # if push failed, exit with error
  if [ $? -ne 0 ]
  then
    echo -e "${RED}Push failed.${CLEAR}"
    return
  else
    echo -e "${GREEN}Pushed succesfully to $REMOTE/$BRANCH.${CLEAR}"
  fi
}
