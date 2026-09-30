function music_sync -d "Copy ~/Music files to external hard drive"
    # Synchronize music library with external source
    echo "Starting music synchronization..."

    if [ ! -d /Volumes/Arxiv ]
        echo "Error: External drive 'Arxiv' is not mounted." >&2
        return 1
    end

    set source_dir ~/Music/Music/Media.localized/Music
    if [ ! -d $source_dir ]
        echo "Error: Source music directory '~/Music/Music/Media.localized/Music' does not exist." >&2
        return 1
    end

    # Example command to sync music (replace with actual sync command)
    rsync --archive --compress --exclude '.DS_Store' --human-readable --progress --update $source_dir/ /Volumes/Arxiv/Music

    if test $status -eq 0
        echo "External drive music synchronization completed."
        # Cloud sync only if local succeeded
        gcloud config configurations activate personal-archive
        GOOGLE_CLOUD_QUOTA_PROJECT=personal-archive-508402 gcloud storage rsync -r -u /Volumes/Arxiv/Music gs://music2323
        if test $status -eq 0
            echo "Cloud music synchronization completed."
        else
            echo "Cloud music synchronization failed." >&2
        end
    else
        echo "External drive music synchronization failed." >&2
    end
end
