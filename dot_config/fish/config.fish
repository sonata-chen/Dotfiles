set fish_greeting

set fish_color_autosuggestion brblack
set fish_color_cancel red --bold
set fish_color_command magenta
set fish_color_comment brblack
set fish_color_cwd green --bold
set fish_color_cwd_root red
set fish_color_end red
set fish_color_error red --bold
set fish_color_escape brcyan
set fish_color_host white
set fish_color_host_remote yellow
set fish_color_match yellow
set fish_color_normal white
set fish_color_operator green
set fish_color_param brblue
set fish_color_quote yellow
set fish_color_redirection brgreen
set fish_color_selection white
set fish_color_status red
set fish_color_user yellow
set fish_color_valid_path --underline
set fish_color_history_current --bold
set fish_color_search_match --background=555
set fish_pager_color_completion green
set fish_pager_color_description blue
set fish_pager_color_prefix white --bold --underline
set fish_pager_color_progress black --bold --background=magenta
set fish_pager_color_selected_background --background=444

eval (dircolors -b ~/.dircolors |sed 2d |string replace "LS_COLORS="  "set -x LS_COLORS ")

set -x BAT_THEME "Solarized (dark)"
# set -x BAT_THEME "ansi-dark"

set -x FZF_DEFAULT_OPTS '
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'
fzf_key_bindings

# set -x MANPAGER "nvim -c 'set ft=man' -"
set -x MANPAGER "nvim +Man!"
# set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -x EDITOR nvim
set -x VISUAL nvim

# set  PATH $HOME/scripts $HOME/.local/bin $PATH
fish_add_path --path $HOME/scripts
fish_add_path --path $HOME/.local/bin

alias config "/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias ntouvpn "sudo openfortivpn 140.121.81.181 -u 00753114 --trusted-cert 889b0abcb900f458d46005ee6b868fc24e69ba3b4d1a5ba11a334f2807c9bf6d"
alias cat='bat'
alias nb='newsboat'

# shell prompt
starship init fish | source

# https://github.com/ajeetdsouza/zoxide
zoxide init fish | source
set -x _ZO_FZF_OPTS "--preview='ls   {2}' --bind=ctrl-z:ignore --exit-0  --height=35%   --inline-info  --no-sort  --reverse  --select-1 $FZF_DEFAULT_OPTS"

# abbreviations
abbr -a -- pkill 'pkill -e'
abbr -a -- vim nvim

# ESP dev tool
set -x IDF_PATH $HOME/src/ntou/esp-idf
set -x ADF_PATH $HOME/src/ntou/esp-adf
alias get_idf='. $IDF_PATH/export.fish'

alias gl="git   log --graph --pretty='%C(auto)%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
abbr -a -- gs 'git status'
abbr -a -- ga 'git add'
abbr -a -- gc 'git commit -m'
abbr -a -- gp 'git push'
abbr -a -- gf 'git fetch'
abbr -a -- rm 'rm -i'
abbr -a -- qm 'udisksctl mount -b'

if command -q exa
    alias ll='exa -l --group-directories-first'
    alias la='exa -al --group-directories-first'
    alias ls='exa'
    alias ld='exa -d .* --group-directories-first'
    alias lt='exa --tree'
else
    alias ll='ls -l --group-directories-first'
    alias la='ls -al --group-directories-first'
    alias ld='ls -d .* --group-directories-first'
    alias lt='tree'
end

if command -q mold
    alias cmake='mold -run cmake'
end

function d
    while test $PWD != "/"
        if test -d .git
            break
        end
        cd ..
    end
end
