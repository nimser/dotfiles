function ubenc --description 'encrypt with Yubikey'
  set output $PWD/$argv[1].$(date +%s).enc
  command gpg --encrypt --armor --output $output -r $GPGID "$argv[1]" && echo "$argv[1] -> $output"
end
