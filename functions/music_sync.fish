function music_sync -d "Copy ~/Music files to external hard drive"
    # Synchronize music library with external source
    echo "Starting music synchronization..."
    # location vars
    set source_dir ~/Music/Music/Media.localized/Music
    set backups_dir /Volumes/Arxiv/Music
    set bucket gs://music2323

    if [ ! -d /Volumes/Arxiv ]
        echo "Error: External drive 'Arxiv' is not mounted." >&2
        return 1
    end

    if [ ! -d $source_dir ]
        echo "Error: Source music directory '~/Music/Music/Media.localized/Music' does not exist." >&2
        return 1
    end

    # Example command to sync music (replace with actual sync command)
    rsync --archive --compress --exclude '.DS_Store' --human-readable --progress --update $source_dir/ $backups_dir

    if test $status -eq 0
        echo "External drive music synchronization completed."
        # Cloud sync only if local succeeded
        gcloud config configurations activate personal-archive
        gcloud storage rsync --recursive --skip-if-dest-has-newer-mtime --exclude '^\.DS_Store$' $backups_dir $bucket
        if test $status -eq 0
            echo "Cloud music synchronization completed."
        else
            echo "Cloud music synchronization failed." >&2
        end
    else
        echo "External drive music synchronization failed." >&2
    end
end
