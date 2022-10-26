" NOTE: keep this at the top to avoid mapping getting lost
" if you set any mappings BEFORE doing this, they will be set to the OLD leader.
let mapleader=","

set number
set nowrap
set splitbelow
set splitright
set pumheight=10           "makes the popup menu smaller
set t_Co=256               "support 256 colors
set noshowmode             "we don't need things like --INSERT-- anywore
"set signcolumn=number      "merge signcolumn and numbercolumn into one
"set formatoptions-=cro     "Stop newline continution of comments
set cursorline             "Highlights the current line
set cursorcolumn           "Highlights the current column
set timeoutlen=2000         "1000 by default

" Preserve absolute numbers in insert mode
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
