eval (dircolors -b ~/.dircolors |sed 2d |string replace "LS_COLORS="  "set -x LS_COLORS ")

alias config "/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
