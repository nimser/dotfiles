" --------------------------------
"       PLUGIN MANAGEMENT
" --------------------------------
" vim-plug, pathogen, vundle, neobundle
call plug#begin('~/.nvim/plugged')
Plug 'jpo/vim-railscasts-theme'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()

"" --------------------------------
""     MAIN CONFIGURATION
"" --------------------------------
let mapleader=","
" TODO Get inspiration from previous .vimrc Sensible, spf13, janus

" TODO See this post for good colorschemes (e.g. molokai, base16, wombat256mod): https://github.com/neovim/neovim/issues/793
colorscheme railscasts

" Fuzzy file searching
" commandt, fuzzyfinder, CtrlP

" Autocomplete and snippets
" YouCompleteMe, NeoComplete

" --------------------------------
"       PLUGINS OPTIONS
" --------------------------------

" NertTree - remap for bepo layout
let NERDTreeMapOpenInTab='<leader>t'
let NERDTreeMapOpenInTabSilent='<leader>T'
let NERDTreeMapOpenVSplit='<leader>s'

" --------------------------------
"       BEPO LAYOUT
" --------------------------------
