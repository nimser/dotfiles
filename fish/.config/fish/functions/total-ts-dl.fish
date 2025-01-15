function total-ts-dl
  yt-dlp "https://stream.mux.com/$argv[1]?max_resolution=2160p&min_resolution=2160p&redundant_streams=true" -o "$argv[2]_$argv[3].mp4"
end
