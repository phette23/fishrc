function music_sync -d "Copy ~/Music files to external hard drive"
    # Synchronize music library with external source
    echo "Starting music synchronization..."

    if [ ! -d /Volumes/Arxiv ]
        echo "Error: External drive 'Arxiv' is not mounted." >&2
        return 1
    end

    if [ ! -d ~/Music/Media.localized/Music ]
        echo "Error: Source music directory '~/Music/Media/Music' does not exist." >&2
        return 1
    end

    # Example command to sync music (replace with actual sync command)
    rsync --archive --compress --exclude '.DS_Store' --human-readable --progress --update ~/Music/Media.localized/Music/ /Volumes/Arxiv/Music

    if test $status -eq 0
        echo "Music synchronization completed."
    else
        echo "Music synchronization failed." >&2
    end
end
