" --------------------------------
"       PLUGIN MANAGEMENT
" --------------------------------
" vim-plug, pathogen, vundle, neobundle
call plug#begin('~/.config/nvim/plugged')
Plug 'jpo/vim-railscasts-theme'
Plug 'scrooloose/nerdtree'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
call plug#end()

" Fuzzy file searching
" commandt, fuzzyfinder, CtrlP

" Autocomplete and snippets: YouCompleteMe, NeoComplete
" Vim Easymotion: Vim motions on speed

"" --------------------------------
""     MAIN CONFIGURATION
"" --------------------------------
let mapleader=","
" TODO Get inspiration from previous .vimrc Sensible, spf13, janus

" TODO See this post for good colorschemes (e.g. molokai, base16, wombat256mod): https://github.com/neovim/neovim/issues/793
colorscheme railscasts


" --------------------------------
"       PLUGINS OPTIONS
" --------------------------------

" NertTree - remap for bepo layout
" Open Nerdtree at startup if no files are specified 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * wincmd p
let NERDTreeMapOpenInTab='<leader>t'
let NERDTreeMapOpenInTabSilent='<leader>T'
let NERDTreeMapOpenVSplit='<leader>s'
nmap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'

" --------------------------------
"       BEPO LAYOUT
" --------------------------------
source ~/.config/nvim/bepo.vim
