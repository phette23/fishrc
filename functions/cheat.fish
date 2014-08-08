function cheat -d 'Cheat sheet for the command line'

    __cheat_heading 'Command Line Cheat Sheet'

    __cheat_ln '^+A\t\t' "jump to beginning of line"
    __cheat_ln '^+E\t\t' "jump to end of line"
    __cheat_ln '^+K\t\t' "delete to end of line"
    __cheat_ln '^+U\t\t' "delete to beginning of line"
    __cheat_ln '^+W\t\t' "delete word next to cursor"
    __cheat_ln 'dataurl\t\t' "make data URL from file"
    __cheat_ln 'gi\t\t' "install Grunt plugin, e.g. 'gi contrib-uglify'"
    __cheat_ln 'lsof -i\t\t' "View programs with open ports & connections"
    __cheat_ln 'mdfind\t\t' "Search Spotlight index"
    __cheat_ln 'spot(off|on)\t' "turn Spotlight off & on"
    __cheat_ln 'tar -zxvf $FILE\t' "unzip tar ball"
    __cheat_ln 'urlencode\t' "URL encode string"
end
