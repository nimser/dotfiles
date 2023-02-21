# needed to use a clone after the original key, or using the original after using a clone
function chub --wraps='gpg-connect-agent "scd serialno" "learn --force" /bye' --description 'switch to a different yubikey'
  gpg-connect-agent "scd serialno" "learn --force" /bye $argv
end
