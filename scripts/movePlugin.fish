#!/bin/fish
set vst_path $HOME/".vst" 
set vst3_path $HOME/".vst3"
set lv2_path $HOME/".lv2" 

for file in $argv
    echo $file
    if  string  match -q '*.so' $file
        and test -f $file
        and test -x $file
        echo "VST"
        mv -v $file $vst_path
    else if  string  match -rq '.*\.vst3/?' $file
        and test -d $file/Contents
        echo "VST3"
        mv -v $file $vst3_path
    else if  string  match -rq '.*\.lv2/?' $file
        and test -d $file
        echo "lv2"
        mv -v $file $lv2_path
    else
        echo "Not a plugin"
    end
end

