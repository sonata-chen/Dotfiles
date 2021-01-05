eval (dircolors -b ~/.dircolors |sed 2d |string replace "LS_COLORS="  "set -x LS_COLORS ")

alias config "/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias ntouvpn "sudo openfortivpn 140.121.81.181 -u 00753114 --trusted-cert 889b0abcb900f458d46005ee6b868fc24e69ba3b4d1a5ba11a334f2807c9bf6d"
alias ll='ls -lh --group-directories-first'
alias cat='bat'
set -x SHELL /bin/bash

# set  -g fish_prompt_git_status_deleted 
# set  -g fish_prompt_git_status_added 

if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
    base16-tomorrow-night-eighties
end
set -x PATH "$HOME/scripts:$HOME/.local/bin:$PATH"

starship init fish | source
