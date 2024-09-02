This is my $HOME
================

This repository contains my complete configuration for awesome, Zsh, Vim etc.

It is actually a work in progress because I try to migrate stuff used in more 
then 15 years to a new and fresh $HOME setup. Don't wonder why some parts look
stupid... ;)

It is a special configured repository where every file is ignored in 
.gitignore. Only files I am sharing accross users/systems are "unignored".

This repo is for my personal use only. Feel free to take a look... ;)

I am using a lot of Git submodules so take care of the licenses of each project.

I use a default wallpaper provided by Willi Thiel licensed under CC BY-BC-SA
2.0 (https://creativecommons.org/licenses/by-nc-sa/2.0/). The source for this 
image is: https://willithiel.photography/photo/31c3-saal-3

Clone to your $HOME
-------------------

    cd ~
    git init .
    git remote add -t \* -f origin git@git.xw3.org:hanez/home.git
    git checkout master
    git submodule update --init --recursive

Existing files will not be overwritten!

Keep your $HOME up to date
--------------------------

The Zsh configuration provides a command named "home" to keep things up to
date. The following command updates your home and all submodules.

    home up

If you want to see a list of all commands run:

    home help

