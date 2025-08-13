# Markdown REadme
function mre -d 'Use glow to display markdown readme in cwd'
    if command --query glow
        cat (find . -type f -iname "readme*" -maxdepth 1) | glow -p
    else
        echo "glow markdown reader not installed; try brew install glow"
    end
end
