--[[
" -------------------------------
"       PLUGIN MANAGEMENT
" --------------------------------
call plug#begin('~/.config/nvim/autoload/plugged')

" LIB DEPENDENCIES
  Plug 'nvim-lua/popup.nvim'                    " Dep for telescope
  Plug 'nvim-lua/plenary.nvim'                  " Lua library for common functions, dep for telescope and others
" GLOBAL SETTINGS
  Plug 'tpope/vim-sleuth'                       " DEPREC? auto set indent settings
" LSP
  Plug 'neovim/nvim-lspconfig'                  " Basic LSP conf for common LSP servers
" ESTHETICS
  Plug 'kyazdani42/nvim-web-devicons'           " Web font
  Plug 'norcalli/nvim-colorizer.lua'            " Colorizer to preview actual colors when typing their hexa vals
  Plug 'chriskempson/base16-vim'                " DEPREC A theming framework
  Plug 'vim-airline/vim-airline'                " DEPREC A powerful status bar for vim
" VERSION CONTROL
  Plug 'airblade/vim-gitgutter'                 " DEPREC? Shows which lines have VC changes in the gutter column
  Plug 'tpope/vim-fugitive'                     " DEPREC? A Git wrapper for vim (displays branch in airline)
" SYNTAX & HIGHLIGHTING
  Plug 'nvim-treesitter/nvim-treesitter',
	\ {'do': ':TSUpdate'}                   " Treesitter
  Plug 'p00f/nvim-ts-rainbow'                   " Sets different colors for parenths in different scopes
  Plug 'sheerun/vim-polyglot'                   " DEPREC?(check if needed with LSP) Better Syntax Support
  "Plug 'chilicuil/vim-sml-coursera'             " Sml plugin
  "Plug 'evanleck/vim-svelte'                    " Svelte syntax highlighting and indentation
  "Plug 'HerringtonDarkholme/yats.vim'           " Typscript hl
  "Plug 'pangloss/vim-javascript'                " Modern js hl
  "Plug 'tomlion/vim-solidity'                   " Syntax highlighting for solidity
" NAVIGATION
  Plug 'nvim-telescope/telescope.nvim',
    \ { 'branch': '0.1.x' }                        " Fuzzy search through files, git history, commands and more
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'unblevable/quick-scope'                 " Highlighting hints for navigation within a single line
  Plug 'easymotion/vim-easymotion'              " Easymotion (navigation/browse through one file)
" AUTO COMPLETION & AUTO INSERTION/DELETION/FORMATTING
  Plug 'hrsh7th/nvim-cmp'                       " Auto completion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'L3MON4D3/LuaSnip'                       " LSP-compatible snippet engine
  Plug 'mattn/emmet-vim'                        " HTML Snippets typing chains like e.g. ul>li>span*a
  Plug 'AndrewRadev/tagalong.vim'               " Auto change html tags
  Plug 'alvan/vim-closetag'                     " Closetags
  Plug 'psliwka/vim-smoothie'                   " Smooth scroll, useful for <c-f>/<c-b>, <c-u>/<c-b>, zz motions
  Plug 'tpope/vim-surround'                     " Adds verb `surround` to target surrounding characters
  "Plug 'jiangmiao/auto-pairs'                   " Auto pairs for '(' '[' '{'
" HELPING MEMORY
  Plug 'folke/which-key.nvim'                   " See what keys do like in emacs

" MISC OTHERS - Activate if need be...
  "Plug 'mbbill/undotree'                        " undo time travel
  "Plug 'szw/vim-maximizer'                      " Maximize/reduce a window among many splits
  "Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  } " Markdown Preview
  "Plug 'tpope/vim-commentary'                   " Comments using vim's expressive language
  "Plug 'airblade/vim-rooter'                    " Scopes FZF within a project (sets root to where .git is) shouldn't be needed thanks to telescope's git_files
  "Plug 'junegunn/limelight.vim'                 " Highlight the current parts of a file you are working on [good for typing long texts]
  "Plug 'junegunn/goyo.vim'                      " Clear up your interface from distractions
  "Plug 'tpope/vim-repeat'                       " Repeat stuff

" Seen on other's config, to try out maybe:
  "Plug 'christianchiarulli/nvcode-color-schemes.vim'    " Themes
  "Plug 'tpope/vim-speeddating'                          " Change dates fast
  "Plug 'glts/vim-radical'                               " Convert binary, hex, etc..
  "Plug 'glepnir/galaxyline.nvim'                        " Lightweight Status Line
  "Plug 'rhysd/git-messenger.vim'                        " Shows message for the last commit of any line
  "Plug 'voldikss/vim-floaterm'                          " Terminal
  "Plug 'honza/vim-snippets'                             " Snippets
  "Plug 'skywind3000/asynctasks.vim'                     " async tasks
  "Plug 'skywind3000/asyncrun.vim'                       " async tasks
  "Plug 'moll/vim-bbye'                                  " Intuitive buffer closing, e.g. prevents closing window on :bdelete
  "Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } "Neovim in Browser's textareas etc...
call plug#end()
]]--
require('which-key').setup{}
