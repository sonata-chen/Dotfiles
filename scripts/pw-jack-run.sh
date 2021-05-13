#!/bin/sh
ls /usr/local/share/applications/ /usr/share/applications/ $HOME/.local/share/applications/  -1 \
| sed ' s/\.desktop$//g ; /:$/d ; /^$/d ' | sort -u | bemenu -i | xargs gtk-launch
