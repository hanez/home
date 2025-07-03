#!/bin/env sh

TARGET=$1

cd $HOME

rm -f ${TARGET}

7z a ${TARGET} bin/cfgxport.sh
7z a ${TARGET} bin/su.sh

7z a ${TARGET} .env

7z a ${TARGET} .config/awesome
7z d ${TARGET} .config/awesome/config.lua
7z d ${TARGET} .config/awesome/vicious/.git*

7z a ${TARGET} .byobu
7z a ${TARGET} .config/byobu

7z a ${TARGET} .screenrc
7z a ${TARGET} .tmux.conf

7z a ${TARGET} .vim*
7z d ${TARGET} .vim/.netrwhist

7z a ${TARGET} .Xresources
7z a ${TARGET} .xinitrc
7z a ${TARGET} .zoha.toml

7z a ${TARGET} .zsh*
7z d ${TARGET} .zsh_history
7z d ${TARGET} .zsh/oh-my-zsh/.git*
7z d ${TARGET} .zsh/oh-my-zsh/custom/themes/powerlevel10k

