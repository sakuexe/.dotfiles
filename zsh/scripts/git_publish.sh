#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
CLEAR="\e[0m"

COMMIT_MSG=$1
DEFAULT_REMOTE=`git remote | head -n 1`
DEFAULT_BRANCH=`git branch --show-current`

# initial refresh and adding
git rm -r --cached . > /dev/null 2>&1  # remove all files from being tracked
# add all files that are not in the gitignore to be tracked
# this is done so that the most recent .gitignore changes can be applied
git add .

# commit, take arguments, or ask for commit message
if ! [ -z "$COMMIT_MSG" ]
then
  git commit -m "$COMMIT_MSG"
else
  echo -n "Give commit message.: "
  read COMMIT_MSG
  git commit -m "$COMMIT_MSG"
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
  exit 1
else
  echo -e "${GREEN}Pushed succesfully to $REMOTE/$BRANCH.${CLEAR}"
fi
