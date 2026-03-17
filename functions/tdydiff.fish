function tdydiff -d "run perltidy on all new & modified Perl files, showing differences"
    set files (git status --porcelain | sed 's|^...||' | grep '\.p[lm]$')
    for f in $files
        echo "=== $f ==="
        perltidy $f # ? do we need to 
        diff -u $f $f.tdy
        and echo "✅ file is tidy"
        rm $f.tdy
    end
end
