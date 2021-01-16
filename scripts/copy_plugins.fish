#!/bin/fish
set vst_path $HOME/".vst"
set vst3_path $HOME/".vst3"
set lv2_path $HOME/".lv2"

function copy_into
    for file in $argv
        echo $file
        if string match -q '*.so' $file
            and test -f $file
            and test -x $file
            echo "VST"
            cp -v $file $vst_path
        else if string match -q '*.vst3' $file
            and test -d $file
            echo "VST3"
            cp -rv $file $vst3_path
        else if string match -q '*.lv2' $file
            and test -d $file
            echo "LV2"
            cp -rv $file $lv2_path
        else
            echo "Not a plugin"
        end
    end
end

function copy_plugins
    if count $argv >/dev/null
        set search_dir $argv
    else
        set search_dir ./
    end

    set contents (fd . $search_dir --type=f --type=d -e=so -e=vst3 -e=lv2 --no-ignore | grep -vE '(\.vst3|\.lv2).*?\.so$' | fzf -m)
    copy_into $contents
end

copy_plugins $argv
