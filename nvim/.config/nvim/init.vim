" Load general configurations
" Note: keep settings.vim loaded first. The leader key needs to be defined
" before any mapping is defined or these won't be loaded at vim start.
" Also be aware that including mappings before plugins might mean they get
" overwitten
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/mappings.vim

" TODO:
" #### Things to grok and improvements
" - [ ] move most of vim config to lua
"   - good example of a full lua config here: https://github.com/Drllap/development_setup/
"   - also in tj's repo: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/
" - [ ] sticky function header with line number like the Primeagen's video: https://youtu.be/8BGr_umDTco?t=198
" - [ ] embed vim-treesitter and make sure it works as expected on ts/tsx, js/jsx, svelte, rust files
" - [ ] take advantage of the Language Server Protocol for go-to-def, whole project analysis etc...
" 		see https://neovim.io/doc/user/lsp.html
" 		- how exactly? list here
" - [ ] move vim config to lua. Some guidance here https://github.com/AlphaKeks/how2nvim/tree/01-Introduction
" - [ ] Use terminal within VIM
" - [ ] Let go of Plug, use native Vim 8 plugin management
" - [ ] have a list of vim cheatsheet (current vim-memo.md) readable in a foating panel for quick read-only access
" - [ ] review buffers navigation e.g. :bnext :bprev etc... and setup mappings (incl. telescope mappings)
" - [ ] find colorschemes after fixing term colors: https://github.com/neovim/neovim/issues/793
" - [ ] mappings for :bnext, :bprev
" - [ ] repace DEPREC plugins by performant alternatives
" #### potential plugins (progressively switching over to a lua stack)
" - [ ] nvim-tree/nvim-tree.lua or nvim-neo-tree/neo-tree.nvim to replace Nerdtree
" - [ ] nvim-lualine/lualine.nvim to replace vim-airline
" - [ ] nvim-lua/plenary.nvim for usefull lua functions
" - [ ]	nvim-telescope/telescope.nvim to replace fzf
" - [ ] ThePrimeagen/harpoon for a list of files to easily jump back and forth to

" -------------------------------
"       PLUGIN MANAGEMENT
" --------------------------------
call plug#begin('~/.config/nvim/autoload/plugged')

" LIB DEPENDENCIES
  Plug 'nvim-lua/popup.nvim'                    " Dep for telescope
  Plug 'nvim-lua/plenary.nvim'                  " Lua library for common functions, dep for telescope and others
" GLOBAL SETTINGS
  Plug 'tpope/vim-sleuth'                       " DEPREC? auto set indent settings
" ESTHETICS
  Plug 'kyazdani42/nvim-web-devicons'           " Web font
  Plug 'norcalli/nvim-colorizer.lua'            " Colorizer to preview actual colors when typing their hexa vals
  Plug 'chriskempson/base16-vim'                " DEPREC A theming framework
  Plug 'vim-airline/vim-airline'                " DEPREC A powerful status bar for vim
" VERSION CONTROL
  Plug 'airblade/vim-gitgutter'                 " DEPREC? Shows which lines have VC changes in the gutter column
  Plug 'tpope/vim-fugitive'                     " DEPREC? A Git wrapper for vim (displays branch in airline)
" SYNTAX & HIGHLIGHTING
  Plug 'nvim-treesitter/nvim-treesitter'        " Treesitter
  Plug 'sheerun/vim-polyglot'                   " DEPREC?(check if needed with LSP) Better Syntax Support
  "Plug 'chilicuil/vim-sml-coursera'             " Sml plugin
  "Plug 'evanleck/vim-svelte'                    " Svelte syntax highlighting and indentation
  "Plug 'HerringtonDarkholme/yats.vim'           " Typscript hl
  "Plug 'pangloss/vim-javascript'                " Modern js hl
  "Plug 'tomlion/vim-solidity'                   " Syntax highlighting for solidity
" NAVIGATION
  Plug 'nvim-telescope/telescope.nvim'          " Fuzzy search through files, git history, commands and more
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  "Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'unblevable/quick-scope'                 " Highlighting hints for navigation within a single line
  Plug 'easymotion/vim-easymotion'              " Easymotion (navigation/browse through one file)
" AUTO COMPLETION & AUTO INSERTION/DELETION/FORMATTING
  Plug 'mattn/emmet-vim'                        " HTML Snippets typing chains like e.g. ul>li>span*a
  Plug 'AndrewRadev/tagalong.vim'               " Auto change html tags
  Plug 'alvan/vim-closetag'                     " Closetags
  Plug 'psliwka/vim-smoothie'                   " Smooth scroll, useful for <c-f>/<c-b>, <c-u>/<c-b>, zz motions
  Plug 'tpope/vim-surround'                     " Adds verb `surround` to target surrounding characters
  Plug 'bronson/vim-trailing-whitespace'        " Mark trailing spaces in red + add `!command` :FixWhitespace
  "Plug 'jiangmiao/auto-pairs'                   " Auto pairs for '(' '[' '{' deprecated in favor of @neoclide/coc-pairs
" HELPING MEMORY
  Plug 'liuchengxu/vim-which-key'               " See what keys do like in emacs

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

" Load plugin-specific configurations
source ~/.config/nvim/plugins_config/quickscope.vim
source ~/.config/nvim/plugins_config/emmet.vim
lua require('telescope_config')


" key shortcuts
nnoremap <F5> :lua package.loaded.telescope_config = nil<cr>:source ~/.config/nvim/init.vim<cr>
nnoremap <leader>ff <cmd>lua require('telescope_config').project_files()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').find_files({cwd='~/.config/nvim/'})<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').find_files({cwd='~/'})<cr>

nnoremap <leader>ei3 :tabe ~/.config/i3/config<cr>
nnoremap <leader>evm :tabe ~/Sync/[M]\ Sys-admin/vim-memo.md<cr>
nnoremap <leader>ewi :tabe ~/Sync/Freelance/workflow-improvement.md<cr>
nnoremap <leader>ek :tabe ~/qmk_firmware/keyboards/centromere/keymaps/nimser/keymap.c<cr>
nnoremap / <cmd>lua require('telescope_config').curr_buf()<cr>


set termguicolors
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark

" --------------------------------
"       PLUGINS OPTIONS
" --------------------------------
" Nvim Colorizer @norcalli/nvim-colorizer.lua
lua require'colorizer'.setup()
" WhichKey
nnoremap <silent> <leader> :WhichKey ','<cr>

" Files where Closetags should be used @alvan/vim-closetag
let g:closetag_xhtml_filenames = '*.html,*.svelte,*.jsx,*.tsx'
let g:closetag_xhtml_filetypes = 'html,svelte,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

let g:tagalong_filetypes = ['html','svelte','jsx']

"" Goyo.vim Limelight integration
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!

" Vim airline
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch']
" Emmets
let g:html_indent_inctags = 'body,head,html,tbody,p,li,dt,dd'

" --------------------------------
"    FILE TYPES SETTINGS & OVERRIDES
" --------------------------------
"example:
"au BufRead,BufNewFile *.vue set ft=html
