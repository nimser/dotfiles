" --------------------------------
"       PLUGIN MANAGEMENT
" --------------------------------
" vim-plug, pathogen, vundle, neobundle
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'                     " Adds verb `surround` to target surrounding characters
Plug 'tpope/vim-commentary'                   " Comments using vim's expressive language
Plug 'scrooloose/nerdtree'                    " Browse files within vim
Plug 'vim-airline/vim-airline'                " A powerful status bar for vim
Plug 'elixir-lang/vim-elixir'                 " Elixir syntax highlighting
Plug 'othree/html5.vim'                       " HTML5 omnicomplete and syntax
Plug 'othree/javascript-libraries-syntax.vim' " Syntax files for common JS libraries
Plug 'digitaltoad/vim-pug'                    " Syntax files for jade templates
Plug 'othree/yajs.vim'                        " Syntax for JS including ES6
Plug 'othree/es.next.syntax.vim'              " Syntax for ESnext
Plug 'tpope/vim-fugitive'                     " A Git wrapper for vim (displays branch in airline)
Plug 'airblade/vim-gitgutter'                 " Shows which lines have VC changes in the gutter column
Plug 'chriskempson/base16-vim'                " A theming framework
Plug 'junegunn/goyo.vim'                      " Clear up your interface from distractions
Plug 'junegunn/limelight.vim'                 " Highlight the current parts of a file you are working on
Plug 'chilicuil/vim-sml-coursera'             " Sml plugin
Plug 'leafgarland/typescript-vim'             " Typescript syntax
Plug 'bronson/vim-trailing-whitespace'        " Mark trailing spaces in red + add `!command` :FixWhitespace
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
set relativenumber

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
" TODO See this post for good colorschemes (e.g. tomorrow, molokai, base16, jellybeans, wombat256mod): https://github.com/neovim/neovim/issues/793
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark


" --------------------------------
"       PLUGINS OPTIONS
" --------------------------------
" Open Nerdtree at startup if no files are specified 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * wincmd p
" NertTree - remap for bepo layout
let NERDTreeMapOpenInTab='<leader>t'
let NERDTreeMapOpenInTabSilent='<leader>T'
let NERDTreeMapOpenVSplit='<leader>s'
nmap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'

" javascript-libraries-syntax
let g:used_javascript_libs = 'vue,react,jasmine'

" Goyo.vim Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Vim airline

let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch']


" --------------------------------
"    FILE TYPES OVERRIDES
" --------------------------------

au BufRead,BufNewFile *.vue set ft=html


" --------------------------------
"       BEPO LAYOUT
" --------------------------------
source ~/.config/nvim/bepo.vim
