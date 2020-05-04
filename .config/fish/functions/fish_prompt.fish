function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # Prefix
    set_color red --dim --bold
    echo -n "["
    set_color normal

    # User
    set_color $fish_color_user
    echo -n $USER
    set_color normal

    echo -n ':'

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    # Suffix
    set_color red --dim --bold
    echo -n "]"
    set_color normal

    # Git prompt
    my_git_prompt
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n '➤ '
    set_color normal
end
