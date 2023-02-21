function ubdec --description 'decrypt with Yubikey'
  set output $(echo "$argv[1]" | rev | cut -c16- | rev)
  command gpg --decrypt --output $output "$argv[1]" && echo "$argv[1] -> $output"
end
