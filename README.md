This is my $HOME
================

It is a special configured repository where every file is ignored in 
.gitignore. Only files I am sharing accross users/systems are "unignored".

This repo is for my personal use only. Feel free to take a look... ;)

Clone to your $HOME
-------------------

    cd ~
    git init .
    git remote add -t \* -f origin https://github.com/hanez/home.git
    git checkout master

Existing files will not be overwritten!
