#!/usr/bin/env bash
# $@ = All arguments, $1, $2 = first and second argument

set -e # exit on error

RED='\e[31m'
GREEN='\e[32m'
CLEAR='\e[0m' # Reset color

# gitinit - git initialize a new repository
# adds all changes, commits them with a message, and pushes to remote
# if the first argument is empty
if [ -z "$1" ]
then
  INIT_MSG='initial commit'
else
  INIT_MSG="$1"
fi

# if the second argument is empty
if [ -z "$2" ]
then
  BRANCH='main'
else
  BRANCH="$2"
fi

echo "Provide a link to the remote:"
read -r REMOTE

git init
git add .
git commit -m "$INIT_MSG"
git branch -M "$BRANCH"
git remote add origin $REMOTE
git push -u origin $BRANCH
