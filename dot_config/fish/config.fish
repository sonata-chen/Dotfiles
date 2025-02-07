set fish_greeting

# set fish_color_autosuggestion brblack
set fish_color_autosuggestion white
set fish_color_cancel red --bold
set fish_color_command magenta
set fish_color_comment white
set fish_color_cwd green --bold
set fish_color_cwd_root red
set fish_color_end red
set fish_color_error red --bold
set fish_color_escape brcyan
set fish_color_host normal
set fish_color_host_remote yellow
set fish_color_match yellow
set fish_color_normal normal
set fish_color_operator green
set fish_color_param brblue
set fish_color_quote yellow
set fish_color_redirection brgreen
set fish_color_selection normal
set fish_color_status red
set fish_color_user yellow
set fish_color_valid_path --underline
set fish_color_history_current --bold
set fish_color_search_match --background=black
set fish_pager_color_completion green
set fish_pager_color_description blue
set fish_pager_color_prefix yellow --bold
set fish_pager_color_progress cyan --underline --bold
set fish_pager_color_selected_background --background=black

fish_add_path --path $HOME/scripts
fish_add_path --path $HOME/.local/bin

# eval (dircolors -b ~/.dircolors |sed 2d |string replace "LS_COLORS="  "set -x LS_COLORS ")

set -x BAT_THEME "TwoDark"
# set -x BAT_THEME "ansi-dark"

set -x FZF_DEFAULT_OPTS '
  --color fg:-1,bg:-1,hl:3,fg+:-1,bg+:0,hl+:3
  --color gutter:-1,query:-1,disabled:0
  --color info:6,prompt:5,spinner:1,pointer:3,marker:1,header:1:bold'
fzf_key_bindings

set -x MANPAGER "nvim +Man!"

set -x EDITOR nvim
set -x VISUAL nvim

alias cat='bat'
alias nb='newsboat'
alias ip='ip -c'

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

alias gl="git   log --graph --pretty='%C(auto)%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
abbr -a -- gs 'git status'
abbr -a -- ga 'git add'
abbr -a -- gc 'git commit -m'
abbr -a -- gp 'git push'
abbr -a -- gf 'git fetch'
abbr -a -- rm 'rm -i'
abbr -a -- qm 'udisksctl mount -b'
abbr -a -- fs 'fenv source'

if command -q eza
    alias ll='eza -l --group-directories-first'
    alias la='eza -al --group-directories-first'
    alias ls='eza'
    alias ld='eza -d .* --group-directories-first'
    alias lt='eza --tree'
else
    alias ll='ls -l --group-directories-first'
    alias la='ls -al --group-directories-first'
    alias ld='ls -d .* --group-directories-first'
    alias lt='tree'
end

# if command -q mold
#     alias cmake='mold -run cmake'
# end

alias p='nvim -m  -R  -c ":set nowrap" -c ":noremap q :q<CR>"'

function d
    set target $PWD
    while test $target != "/"
        if test -d $target/.git
            cd "$target"
            break
        else
            set target (realpath $target/../)
        end
    end
end

# CMake
set -x CMAKE_COLOR_DIAGNOSTICS "ON"
set -x CMAKE_GENERATOR "Ninja Multi-Config"
set -x CMAKE_C_COMPILER_LAUNCHER "ccache"
set -x CMAKE_CXX_COMPILER_LAUNCHER "ccache"
set -x CMAKE_EXPORT_COMPILE_COMMANDS "ON"
set -x CMAKE_TOOLCHAIN_FILE "$HOME/.config/tool_chain.cmake"
