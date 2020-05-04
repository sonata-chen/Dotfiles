eval (dircolors -b ~/.dircolors |sed 2d |string replace "LS_COLORS="  "set -x LS_COLORS ")

alias config "/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

# set  -g fish_prompt_git_status_deleted 
# set  -g fish_prompt_git_status_added 
