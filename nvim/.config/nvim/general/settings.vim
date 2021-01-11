let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:node_host_prog = expand("~/.nvm/versions/node/v12.19.0/bin/node")

let mapleader=","
set number
set nowrap
set splitbelow
set splitright
set pumheight=10           "makes the popup menu smaller
set t_Co=256               "support 256 colors
set noshowmode             "we don't need things like --INSERT-- anywore
"set signcolumn=number      "merge signcolumn and numbercolumn into one
set formatoptions-=cro     "Stop newline continution of comments
set cursorline             "Highlights the current line
set timeoutlen=5000         "1000 by default

" Preserve absolute numbers in insert mode
" TODO Fix lag in displaying absolute numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set clipboard=unnamedplus

" -----> Persistent undo <------
if has("persistent_undo")
    set undodir=~/.config/nvim/runtime/undodir
    set undofile
endif

" -----> Indentation <------
" Note: (expandtab,softtabstop,shiftwidth,smarttab etc...) managed by vim-sleuth
set mousehide           " cache la souris quand on se sert du clavier

" Force saving even when the editor isn't open with sudo
cmap w!! w !sudo tee %
