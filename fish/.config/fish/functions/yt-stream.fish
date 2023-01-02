function yt-stream
  yt-dlp -f 251 "$argv" -o $XDG_RUNTIME_DIR/ytaudio | yt-dlp -f bestvideo "$argv" -o - | mpv --audio-file="$XDG_RUNTIME_DIR/ytaudio" - --force-seekable=yes --demuxer-max-bytes=1G
end
