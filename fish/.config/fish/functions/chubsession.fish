# Seems useful if getting a "No secret key" error when decrypting / seting expiry
function chubsession --wraps='gpg-connect-agent reloadagent /bye' --description 'fix issues where pinentry doesn\'t appear on terminal and error "No secret key" shows'
  gpg-connect-agent reloadagent /bye
end
