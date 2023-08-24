function pipup -d 'upgrade all pip packages (in the current env)'
    pip list --outdated --not-required | sed '1,2d' | cut -d ' ' -f 1 | xargs -n1 pip install -U
end
