" --------------------------------
"       PLUGIN MANAGEMENT
" --------------------------------
" vim-plug, pathogen, vundle, neobundle
call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'jiangmiao/auto-pairs'                   " Auto pairs for '(' '[' '{'
  Plug 'romgrk/barbar.nvim'                     " Better tabline
  Plug 'chriskempson/base16-vim'                " A theming framework
  Plug 'norcalli/nvim-colorizer.lua'            " Colorizer
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
  Plug 'mattn/emmet-vim'                        " Snippets
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " FZF
  Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'                      " Clear up your interface from distractions
  Plug 'junegunn/gv.vim'                        " Git history viewer
  Plug 'junegunn/limelight.vim'                 " Highlight the current parts of a file you are working on
  Plug 'unblevable/quick-scope'                 " Text Navigation
  Plug 'scrooloose/nerdtree'                    " Browse files within vim
  Plug 'kevinhwang91/rnvimr'                    " Use ranger in a floating window
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  } " Markdown Preview
  Plug 'szw/vim-maximizer'                      " Maximize/reduce a window among many splits
  Plug 'nvim-treesitter/nvim-treesitter'        " Treesitter
  Plug 'kyazdani42/nvim-web-devicons'           " Cool Icons
  Plug 'AndrewRadev/tagalong.vim'               " Auto change html tags
  Plug 'mbbill/undotree'                        " undo time travel
  Plug 'sheerun/vim-polyglot'                   " Better Syntax Support
  Plug 'vim-airline/vim-airline'                " A powerful status bar for vim
  Plug 'alvan/vim-closetag'                     " Closetags
  Plug 'tpope/vim-commentary'                   " Comments using vim's expressive language
  Plug 'easymotion/vim-easymotion'              " Easymotion
  Plug 'tpope/vim-fugitive'                     " A Git wrapper for vim (displays branch in airline)
  Plug 'airblade/vim-gitgutter'                 " Shows which lines have VC changes in the gutter column
  Plug 'airblade/vim-rooter'                    " Have the file system follow you around
  Plug 'tpope/vim-sleuth'                       " auto set indent settings
  Plug 'psliwka/vim-smoothie'                   " Smooth scroll
  Plug 'tpope/vim-surround'                     " Adds verb `surround` to target surrounding characters
  Plug 'chilicuil/vim-sml-coursera'             " Sml plugin
  Plug 'bronson/vim-trailing-whitespace'        " Mark trailing spaces in red + add `!command` :FixWhitespace
  Plug 'liuchengxu/vim-which-key'               " See what keys do like in emacs

" Activate if need be...
  "Plug 'ChristianChiarulli/far.vim'             " Find and replace across files
  "Plug 'tomlion/vim-solidity'                   " Syntax highlighting for solidity

" Seen on other's config, to try out:
  "Plug 'christianchiarulli/nvcode-color-schemes.vim' " Themes
  "Plug 'tpope/vim-speeddating' "Change dates fast
  "Plug 'glts/vim-radical' "Convert binary, hex, etc..
  "Plug 'tpope/vim-repeat' "Repeat stuff
  "Plug 'glepnir/galaxyline.nvim' "Lightweight Status Line
  "Plug 'rhysd/git-messenger.vim' "Shows message for the last commit of any line
  "Plug 'voldikss/vim-floaterm' "Terminal
  "Plug 'mhinz/vim-startify' "Start Screen
  "Plug 'honza/vim-snippets' "Snippets
  "Plug 'skywind3000/asynctasks.vim'  "async tasks
  "Plug 'skywind3000/asyncrun.vim' "async tasks
  "Plug 'moll/vim-bbye' " Intuitive buffer closing
  "Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } "Neovim in Browser
call plug#end()


"" --------------------------------
""     MAIN CONFIGURATION
"" --------------------------------
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:node_host_prog = expand("~/.nvm/versions/node/v12.19.0/bin/node")
let mapleader=","
set number
" Preserve absolute numbers in insert mode
" TODO Fix lag in displaying absolute numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set clipboard+=unnamedplus

" -----> Persistent undo <------
if has("persistent_undo")
    set undodir=~/.config/nvim/runtime/undodir
    set undofile
endif

" -----> Indentation <------
" Note: (expandtab,softtabstop,shiftwidth,smarttab etc...) managed by vim-sleuth
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

" Goyo.vim Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Vim airline
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch']

" --------------------------------
"    FILE TYPES OVERRIDES
" --------------------------------

"example:
"au BufRead,BufNewFile *.vue set ft=html


" --------------------------------
"       BEPO LAYOUT
" --------------------------------
source ~/.config/nvim/bepo.vim
