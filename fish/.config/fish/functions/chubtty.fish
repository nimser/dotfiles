function chubtty --wraps='gpg-connect-agent updatestartuptty /bye' --description 'fix issues where pinentry doesn\'t appear on terminal (e.g. while using SSH)'
  gpg-connect-agent updatestartuptty /bye
end
