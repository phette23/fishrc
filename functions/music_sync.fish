function music_sync -d "Copy ~/Music files to external hard drive"
    # Synchronize music library with external source
    echo "Starting music synchronization..."

    if [ ! -d /Volumes/Arxiv ]
        echo "Error: External drive 'Arxiv' is not mounted." >&2
        return 1
    end

    if [ ! -d ~/Music/Music ]
        echo "Error: Source music directory '~/Music/Music' does not exist." >&2
        return 1
    end

    # Example command to sync music (replace with actual sync command)
    rsync --archive --compress --human-readable --progress --update ~/Music/Music/ /Volumes/Arxiv/Music/Music

    echo "Music synchronization completed."
end
