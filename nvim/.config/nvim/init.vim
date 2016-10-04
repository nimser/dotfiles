" --------------------------------
"       PLUGIN MANAGEMENT
" --------------------------------
" vim-plug, pathogen, vundle, neobundle
call plug#begin('~/.config/nvim/plugged')
Plug 'jpo/vim-railscasts-theme'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

" Fuzzy file searching
" commandt, fuzzyfinder, CtrlP

" Autocomplete and snippets: YouCompleteMe, NeoComplete
" Vim Easymotion: Vim motions on speed

"" --------------------------------
""     MAIN CONFIGURATION
"" --------------------------------

let mapleader=","
set number

" -----> Persistent undo <------ 
if has("persistent_undo")
    set undodir=~/.config/nvim/runtime/undodir
    set undofile
endif

" -----> Indentation <------      
set expandtab           " spaces instead of tabs
set softtabstop=2       " size of one tab in spaces
set shiftwidth=2
set mousehide           " cache la souris quand on se sert du clavier

" -----> Command mappings <------      
cnoreabbrev W w

inoremap <Tab> <Esc>
vnoremap <Tab> <Esc>

inoremap <S-Tab> <Tab>
vnoremap <S-Tab> <Tab>

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

" Goyo.vim Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Vim-Markdown
"let g:vim_markdown_new_list_item_indent = 2

" --------------------------------
"       BEPO LAYOUT
" --------------------------------
source ~/.config/nvim/bepo.vim
