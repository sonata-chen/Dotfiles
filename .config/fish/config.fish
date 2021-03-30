eval (dircolors -b ~/.dircolors |sed 2d |string replace "LS_COLORS="  "set -x LS_COLORS ")

set -x BAT_THEME "Solarized (dark)"
# set -x BAT_THEME "ansi-dark"

set -x FZF_DEFAULT_OPTS '
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'

set -x MANPAGER "nvim -c 'set ft=man' -"
# set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -x EDITOR nvim
set -x VISUAL nvim

set -x PATH "$HOME/scripts:$HOME/.local/bin:$PATH"

alias config "/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias ntouvpn "sudo openfortivpn 140.121.81.181 -u 00753114 --trusted-cert 889b0abcb900f458d46005ee6b868fc24e69ba3b4d1a5ba11a334f2807c9bf6d"
alias ll='ls -lh --group-directories-first'
alias cat='bat'
alias nb='newsboat'

# shell prompt
starship init fish | source
