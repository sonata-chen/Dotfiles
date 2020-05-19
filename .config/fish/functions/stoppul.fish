function stoppul
    systemctl --user mask pulseaudio.socket
    systemctl --user stop pulseaudio.socket
    systemctl --user stop pulseaudio
end
