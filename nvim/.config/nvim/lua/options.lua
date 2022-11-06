-- major inspiration: benfrain's Gist (and youtube video) https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f 
-- FIXME change minimum size that is visible when selecting a split. It should be a bit over half the width of the screen
local opt = vim.opt
-- formatoptions: r->auto comments on i_<cr>, o->auto comments on n_o/n_O
-- use i_<c-u> to clearup any unwanted auto comment
opt.formatoptions:append'ro'    -- defaults to "tcqj"

-- +nostop -eol -indent forces me to use vim-specific commands more. 
-- e.g. <bs>/<del> won't erase autoindent & line breaks
opt.backspace = {"nostop"} -- defaults to {"indent", "eol", "start"}
opt.completeopt = {"menu", "menuone", "noselect"} -- could add preview for additional info of selected option
opt.cursorline = true -- Highlights the current line
opt.cursorcolumn = true -- Highlights the current column
opt.clipboard = "unnamedplus"
opt.expandtab = true -- use spaces instead of tabs
opt.foldenable = false -- folds are expanded when file opens
opt.foldmethod = "indent" -- Lines with equal indent form a fold.
opt.ignorecase = true -- partly overwridden by smartcase
opt.inccommand = "split" -- Get a preview of replacements
opt.jumpoptions = "view" -- When moving through the jumplist, |changelist|, |alternate-file| or using |mark-motions| try to restore the |mark-view| in which the action occurred.
-- opt.incsearch = true -- Shows the match while typing (defaults to true)
opt.lazyredraw = true -- avoids redrawing while performing macros to prevent lags
opt.list = true -- Show some invisible characters
opt.listchars = { tab = " ", trail = "·" }
opt.mouse = "a"
opt.number = true
opt.pumheight = 10 -- makes the popup menu smaller
opt.scrolloff = 6 -- Lines of context
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.shiftwidth = 2 -- Size of an indent
opt.showmode = false -- removes --INSERT-- and the like in statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes:1" -- always show signcolumns
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
opt.timeoutlen = 500 -- 1000 by default
opt.title = true -- Allows neovim to send the Terminal details of the current window, instead of just getting 'v'
opt.undodir = vim.fn.stdpath("config") .. "/undo"
opt.undofile = true
opt.whichwrap = "[,]"
opt.wrap = true

-- Set relativenumber but preserve absolute numbers in insert mode
vim.cmd[[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
]]

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

-- This is global settings for diagnostics
vim.o.updatetime = 250
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

--[[

" -----> Indentation <------
" Note: (expandtab,softtabstop,shiftwidth,smarttab etc...) managed by vim-sleuth

" Force saving even when the editor isn't open with sudo
cmap w!! w !sudo tee %
]]--
