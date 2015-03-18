function caudio -d 'load or unload coreaudio daemon'
    # work around annoying CPU usage bug in Yosemite
    # where coreaudiod takes up ≈70% of CPU even when no audio is playing
    if [ (count $argv) -eq 0 ]
        echo 'Usage: caudio (start|stop)'
        echo 'Will ask for password because sudo is used.'
        return 0
    end

    if [ $argv[1] = 'stop' ]
        sudo launchctl unload /system/library/launchdaemons/com.apple.audio.coreaudiod.plist
    end

    if [ $argv[1] = 'start' ]
        sudo launchctl load /system/library/launchdaemons/com.apple.audio.coreaudiod.plist
    end
end
