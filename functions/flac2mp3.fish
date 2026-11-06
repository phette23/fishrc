function flac2mp3 -d "Convert all FLAC files in cwd to MP3 at 320kbps"
    if not command --query ffmpeg
        echo "ffmpeg is not installed. Please install it first."
        return 1
    end
    for file in *.flac
        set mp3file (string replace -r '\.flac$' '.mp3' $file)
        # flags mean: 320kbps audio bitrate, copy metadata, use ID3v2.3 metadata tags
        ffmpeg -i $file -ab 320k -map_metadata 0 -id3v2_version 3 $mp3file
    end
end
