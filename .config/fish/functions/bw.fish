function bw --description 'set BootNext to Windows Boot Manager'
    sudo efibootmgr -n (efibootmgr | grep Windows | cut -d " " -f 1 | sed 's/Boot//g' | sed 's/*//g') 
end
