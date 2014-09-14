function wgetm -d 'Recursively download a website for offline/mirroring use'
    # be polite - wait 10 seconds between each request, limit dl rate
    wget -m $argv[1] --wait=10 --limit-rate=20K --convert-links
end
