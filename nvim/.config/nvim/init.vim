" --------------------------------
"       PLUGIN MANAGEMENT
" --------------------------------
call plug#begin('~/.config/nvim/autoload/plugged')
  "Plug 'jiangmiao/auto-pairs'                   " Auto pairs for '(' '[' '{'
  "Plug 'romgrk/barbar.nvim'                     " Better tabline
  Plug 'chriskempson/base16-vim'                " A theming framework
  Plug 'norcalli/nvim-colorizer.lua'            " Colorizer
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
  Plug 'mattn/emmet-vim'                        " Snippets
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " FZF
  Plug 'junegunn/fzf.vim'                       " FZF
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
  Plug 'easymotion/vim-easymotion'              " Easymotion (navigation/browse through one file)
  Plug 'tpope/vim-fugitive'                     " A Git wrapper for vim (displays branch in airline)
  Plug 'airblade/vim-gitgutter'                 " Shows which lines have VC changes in the gutter column
  Plug 'airblade/vim-rooter'                    " Scopes FZF within a project (sets root to where .git is)
  Plug 'tpope/vim-sleuth'                       " auto set indent settings
  Plug 'psliwka/vim-smoothie'                   " Smooth scroll
  Plug 'tpope/vim-surround'                     " Adds verb `surround` to target surrounding characters
  Plug 'chilicuil/vim-sml-coursera'             " Sml plugin
  Plug 'bronson/vim-trailing-whitespace'        " Mark trailing spaces in red + add `!command` :FixWhitespace
  Plug 'liuchengxu/vim-which-key'               " See what keys do like in emacs
  Plug 'evanleck/vim-svelte'                    " Svelte syntax highlighting and indentation
  Plug 'pangloss/vim-javascript'                " Modern js hl
  Plug 'HerringtonDarkholme/yats.vim'           " Typscript hl

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

" Load plugin-specific configurations
source  ~/.config/nvim/plugins_config/coc.vim
source  ~/.config/nvim/plugins_config/quickscope.vim
source  ~/.config/nvim/plugins_config/fzf.vim
" Load general configurations
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/mappings.vim
" open/source neovim's main configuration file
nnoremap <leader>sc :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ec :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>ebc :tabe ~/.config/nvim/bepo.vim<CR>
nnoremap <leader>i3 :tabe ~/.config/i3/config<CR>
nnoremap <leader>vm :tabe ~/Sync/[M]\ Sys-admin/vim-memo.md<CR>
nnoremap <leader>ek :tabe ~/qmk_firmware/keyboards/centromere/keymaps/nimser/keymap.c<CR>
nnoremap <leader>fk :!qmk flash -kb centromere -km nimser<CR>


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

" Files where Closetags should be enabled
let g:closetag_xhtml_filenames = '*.html,*.svelte,*.jsx'
let g:closetag_xhtml_filetypes = 'html,svelte,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

let g:tagalong_filetypes = ['html','svelte','jsx']

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

