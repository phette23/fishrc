function npmgup -d 'Update all global NPM packages'

    for package in (npm -g outdated --parseable --depth=0 | cut -d: -f2 | grep --invert-match '@linked$')
        npm -g install "$package"
    end

end
