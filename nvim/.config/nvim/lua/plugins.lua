-- major inspiration: benfrain's Gist (and youtube video) https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f 

-- automatically run :PackerCompile whenever plugins.lua is updated
--vim.cmd([[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--  augroup end
--]])

local get_setup = function(name)
  return string.format('require"setup/%s"', name)
end

-- vim.cmd [[packadd packer.nvim]] -- only needed if installing packer with opt = true
return require('packer').startup(function(use)
  -- Please order by alphabetic order, ignoring non-specific (e.g. vim) prefixes
  use 'wbthomason/packer.nvim'

  use { 'lukas-reineke/indent-blankline.nvim', config = get_setup('indent-blankline') } -- adds indentation guides to all lines (including empty lines)
  -- LSP
  use { 'neovim/nvim-lspconfig',                  -- Basic LSP conf for common LSP servers
    config = get_setup('lspconfig'),
  }
-- ESTHETICS
  use 'kyazdani42/nvim-web-devicons'           -- Web font
  use { 'norcalli/nvim-colorizer.lua',         -- Colorizer to preview actual colors when typing their hexa vals
    config = get_setup('colorizer'),
  }
  use 'vim-airline/vim-airline'                -- DEPREC A powerful status bar for vim
-- VERSION CONTROL
  use 'airblade/vim-gitgutter'                 -- DEPREC? Shows which lines have VC changes in the gutter column
  use 'tpope/vim-fugitive'                     -- DEPREC? A Git wrapper for vim (displays branch in airline)
-- SYNTAX & HIGHLIGHTING
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = get_setup('treesitter'),
  } -- NOTE Packer gotchas see https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
  use { 'p00f/nvim-ts-rainbow',                -- Sets different colors for parenths in different scopes
    requires = {{'nvim-treesitter/nvim-treesitter'}}
  }
 -- use 'sheerun/vim-polyglot'                   -- DEPREC?(check if needed with LSP) Better Syntax Support
  --use 'chilicuil/vim-sml-coursera'             -- Sml plugin
  --use 'evanleck/vim-svelte'                    -- Svelte syntax highlighting and indentation
  --use 'HerringtonDarkholme/yats.vim'           -- Typscript hl
  --use 'pangloss/vim-javascript'                -- Modern js hl
  --use 'tomlion/vim-solidity'                   -- Syntax highlighting for solidity
-- NAVIGATION
  use { 'nvim-telescope/telescope.nvim',       -- Fuzzy search through files, git history, commands and more
    branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'},               -- Lua library for common functions
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'nvim-telescope/telescope-file-browser.nvim'},
    },
    config = get_setup('telescope'),
  }
  use 'unblevable/quick-scope'                 -- Highlighting hints for navigation within a single line
  use 'easymotion/vim-easymotion'              -- Easymotion (navigation/browse through one file)
-- AUTO COMPLETION & AUTO INSERTION/DELETION/FORMATTING
  use { 'hrsh7th/nvim-cmp',                      -- Auto completion
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'L3MON4D3/LuaSnip' },                  -- LSP-compatible snippet engine FIXME determine if I really need this
    },
    config = get_setup('cmp'),
  }
  use 'mattn/emmet-vim'                        -- HTML Snippets typing chains like e.g. ul>li>span*a
  use 'AndrewRadev/tagalong.vim'               -- Auto change html tags
  use 'alvan/vim-closetag'                     -- Closetags
  use 'psliwka/vim-smoothie'                   -- Smooth scroll, useful for <c-f>/<c-b>, <c-u>/<c-b>, zz motions
  use 'tpope/vim-surround'                     -- Adds verb `surround` to target surrounding characters
  --use 'windwp/nvim-autopairs'                  -- Auto pairs for e.g.'(' '[' '{'
-- HELPING MEMORY
  use { 'folke/which-key.nvim',                  -- See what keys do like in emacs
    config = get_setup('which-key'),
  }

-- MISC OTHERS - Activate if need be...
  --use 'mbbill/undotree'                        -- undo time travel
  --use 'szw/vim-maximizer'                      -- Maximize/reduce a window among many splits
  --use 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  } -- Markdown Preview
  --use 'tpope/vim-commentary'                   -- Comments using vim's expressive language
  --use 'airblade/vim-rooter'                    -- Scopes FZF within a project (sets root to where .git is) shouldn't be needed thanks to telescope's git_files
  --use 'junegunn/limelight.vim'                 -- Highlight the current parts of a file you are working on [good for typing long texts]
  --use 'junegunn/goyo.vim'                      -- Clear up your interface from distractions
  --use 'tpope/vim-repeat'                       -- Repeat stuff

-- Seen on other's config, to try out maybe:
  --use 'christianchiarulli/nvcode-color-schemes.vim'    -- Themes
  --use 'tpope/vim-speeddating'                          -- Change dates fast
  --use 'glts/vim-radical'                               -- Convert binary, hex, etc..
  --use 'glepnir/galaxyline.nvim'                        -- Lightweight Status Line
  --use 'rhysd/git-messenger.vim'                        -- Shows message for the last commit of any line
  --use 'voldikss/vim-floaterm'                          -- Terminal
  --use 'honza/vim-snippets'                             -- Snippets
  --use 'skywind3000/asynctasks.vim'                     -- async tasks
  --use 'skywind3000/asyncrun.vim'                       -- async tasks
  --use 'moll/vim-bbye'                                  -- Intuitive buffer closing, e.g. prevents closing window on :bdelete
  --use 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } "Neovim in Browser's textareas etc...
end)

