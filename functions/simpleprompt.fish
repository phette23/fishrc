function simpleprompt -d 'A simple prompt for distraction-free screencasts'
    echo 'Simple prompt started. Source ~/.config/fish/config.fish to return to complex.'

    function fish_prompt
        set_color FF0
        echo -n '$ '
        set_color normal
    end

end
