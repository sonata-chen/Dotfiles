function startpul
    systemctl --user unmask pulseaudio.socket
    systemctl --user start pulseaudio.socket
    systemctl --user start pulseaudio
end
