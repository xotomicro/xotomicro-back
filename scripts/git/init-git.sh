#!/bin/bash

default_branch=$(basename $(git symbolic-ref --short refs/remotes/origin/HEAD))

git checkout --orphan tmp
git add -A                         # add all files and commit them
git commit -m "blast off 🚀"        # temp message
git branch -D $default_branch      # deletes the default branch
git branch -m $default_branch      # rename the current branch to default
git push -f origin $default_branch # force push default branch to github
git gc --aggressive --prune=all    # remove the old files
