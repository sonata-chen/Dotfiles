function tad --description 'Toggle audio playback device between built-in monitor speaker and headphone'
    set currentMaster (pacmd list-cards | grep "active profile" | sed 's/\s*active profile: <//g'|sed 's/>//g')

    if test "$currentMaster" = "output:hdmi-stereo"
        pacmd set-card-profile 0  output:analog-stereo
    else
        pacmd set-card-profile 0  output:hdmi-stereo
    end
end
