-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.g.mapleader = ","
vim.g.maplocalleader = " "
-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = false
-- Note: Use <localleader> for:
-- 1. Filetype-specific commands (e.g., running tests in Python, formatting in code).
-- 2. Reducing 'leader' key clutter (avoiding too many global mappings).
-- 3. Maintaining consistent commands across filetypes (e.g., <localleader>f for formatting, regardless of language).
-- 4. Resolving plugin conflicts (allows multiple plugins to use same keys in different filetypes).

local opt = vim.opt
-- Don't go to begining of line with a # comment
vim.opt.cindent = true
vim.opt.cinkeys:remove('0#')
-- formatoptions: r->auto comments on i_<cr>, o->auto comments on n_o/n_O (n_ notation => normal mode)
-- use i_<c-u> to clearup any unwanted auto comment
-- opt.formatoptions:append("ro") -- lazyvim defaults: "jcroqlnt", neovim defaults: "tcqj"
opt.cursorcolumn = true -- Highlights the current column
opt.foldenable = false  -- folds are expanded when file opens
-- opt.lazyredraw = true -- avoids redrawing while performing macros to prevent lags
opt.listchars = { tab = " ", trail = "·" }
opt.scrolloff = 6        -- Lines of context
opt.signcolumn = "yes:1" -- always show signcolumns
opt.title = true         -- Allows neovim to send the Terminal details of the current window, instead of just getting 'v'
opt.whichwrap = "[,]"
opt.wrap = true

-- global settings for diagnostics
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
