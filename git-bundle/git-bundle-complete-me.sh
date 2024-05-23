#!/bin/bash

############################################################################
#
# Author:		Johnathan Bernat
# Date:			22 Jul 2022
# Description: Prepares git repository for bundle to transfer and sync to airgap env repo
# Input parameters:	
# Sample usage:	./script
#
#############################################################################

IFS=$'\n'

REMOTE='origin/'
START_BRANCH='main'

#git switch $START_BRANCH    #add function to check for main instead
git checkout $START_BRANCH # if git version older that v2.23

echo 'Starting Loop'
for branch in $(git branch -r) ; do
  BRANCH=$(echo $branch | xargs)
  echo "--- Running $BRANCH ---"
  BRANCH_NAME=$(echo $BRANCH | awk -F$REMOTE '{print $2}')
  if [[ $BRANCH_NAME != *$START_BRANCH* && $BRANCH_NAME != *"HEAD"* ]]; then
    echo "$BRANCH_NAME tracking $BRANCH"
    #git switch -c $BRANCH_NAME --track $BRANCH
    git checkout -b $BRANCH_NAME $BRANCH # if git version older that v2.23
  fi
done

echo 'done with loop'
#git switch $START_BRANCH
git checkout $START_BRANCH # if git version older that v2.23

unset IFS




# work remaining

# https://stackoverflow.com/questions/3635952/how-to-use-git-bundle-for-keeping-development-in-sync
# https://stackoverflow.com/questions/2765421/how-do-i-push-a-new-local-branch-to-a-remote-git-repository-and-track-it-too

#git remote add bundle /home/user/git_repo.bundle
#git fetch bundle
#git remote remove bundle
#git checkout Deployment/Dev
#git push -u Deployment/Dev