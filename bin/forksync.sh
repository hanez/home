#!/bin/bash

#for repo in $(ls /home/hanez/forks | tr '\n' ' '); do
for repo in /home/hanez/forks/*; do
    echo ">>> Updating Fork: $repo"
    cd $repo

    git fetch upstream

    git checkout master
    
    #git rebase upstream/master
    git merge upstream/master

    git push -f origin master
done

