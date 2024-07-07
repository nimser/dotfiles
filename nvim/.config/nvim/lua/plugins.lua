-- major inspiration: benfrain's Gist (and youtube video) https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f 

-- automatically run :PackerCompile whenever plugins.lua is updated
--vim.cmd([[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--  augroup end
--]])

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local get_setup = function(name)
  return string.format('require"setup/%s"', name)
end

-- vim.api.nvim_command("packadd packer.nvim") -- only needed if installing packer with opt = true
return require('packer').startup({function(use)
  -- PACKER ITSELF
  use 'wbthomason/packer.nvim'

  -- LSP
  use { 
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',                  -- Basic LSP conf for common LSP servers
    config = get_setup('lspconfig'),
  }

  -- ESTHETICS
  use { "catppuccin/nvim", as = "catppuccin", config = get_setup("catppuccin") }
  use 'kyazdani42/nvim-web-devicons'           -- Web font
  use { 'norcalli/nvim-colorizer.lua',         -- Colorizer to preview actual colors when typing their hexa vals
    config = get_setup('colorizer'),
  }
  use({
    "nvim-lualine/lualine.nvim",
    config = get_setup("lualine"),
    event = "VimEnter",
    requires = { "kyazdani42/nvim-web-devicons" },
  })
  use { 'lukas-reineke/indent-blankline.nvim', config = get_setup('indent-blankline') } -- adds indentation guides to all lines (including empty lines)
  --use 'usestevearc/dressing.nvim'              -- override core UI hooks
  -- VERSION CONTROL
  --use 'airblade/vim-gitgutter'                 -- DEPREC? Shows which lines have VC changes in the gutter column
  --use { "kdheepak/lazygit.nvim" } -- use lazygit from vim: (see jesseduffield/lazygit)
  -- SYNTAX & HIGHLIGHTING
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = get_setup('treesitter'),
  } -- NOTE Packer gotchas see https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
  --use { 'p00f/nvim-ts-rainbow',                -- Sets different colors for parenths in different scopes. Disabled because some inconsistencies, at least in lua files (same line {} are sometimes not the same color)
  --  requires = {{'nvim-treesitter/nvim-treesitter'}}
  --}
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
  use {
    'rlane/pounce.nvim',                       -- Easymotion replacement, also see phaazon/hop.nvim
    config = get_setup('pounce'),
  }
  -- FORMATTING
  --use { 'junegunn/vim-easy-align' } -- What bashbunny might be using here: https://youtu.be/YEVL3-5n8LI?t=550
  -- AUTO COMPLETION & AUTO INSERTION/DELETION/FORMATTING
  use 'tpope/vim-abolish' -- for case-sensitive replacements including word variations and more
  use { 'hrsh7th/nvim-cmp',                      -- Auto completion
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' }, -- Expand LSP snippets
      { 'onsails/lspkind.nvim' }, -- vscode-like pictograms in cmp list
      -- TODO format_on_save: { 'lukas-reineke/lsp-format.nvim' },
      -- TODO format_on_save: { 'mattn/efm-langserver' }
      -- TODO linting/format_on_save: { 'creativenull/efmls-configs-nvim' }
      -- FIXME add hrsh7th/cmp-nvim-lsp-signature-help to display signature while typing params or use the solution shipped by lspsaga
    },
    config = get_setup('cmp'),
  }
  use { 'mattn/emmet-vim', setup = require('setup.emmet') } -- HTML Snippets typing chains like e.g. ul>li>span*a
  use 'windwp/nvim-ts-autotag'               -- Auto close and change html matching tags
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
  --use 'svrana/neosolarized.nviml'                      -- a Truecolor, Solarized dark theme
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
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
  }
})
