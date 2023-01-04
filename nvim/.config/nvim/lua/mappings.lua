-- NOTE: keep this at the top to avoid mapping getting lost
-- if you set any mappings BEFORE doing this, they will be set to the OLD leader.
vim.g.mapleader = ","

-- Helper function for mappings
local M = {}
local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true } -- set mappings to non-recursive by default
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Command line abbreviations
local cnoreabbrev = vim.cmd.cnoreabbrev

-- For reference (NOTE: "nore" in e.g. noremap means "not recursive")
--                                                     *map-table*
--  Mode (Lua arg)| Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang | ~
-- Command        +------+-----+-----+-----+-----+-----+------+------+ ~
-- [nore]map  ""  | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- n[nore]map "n" | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- [nore]map! "!" |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- i[nore]map "i" |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- c[nore]map "c" |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- v[nore]map "v" |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x[nore]map "x" |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- s[nore]map "s" |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- o[nore]map "o" |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- t[nore]map "t" |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- l[nore]map "l" |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |

-----> Command mappings and abbrevs <------
cnoreabbrev("W", "w")
-----> Multi-mode mappings <------
map("", "gf", "<c-w>gf") -- open the file under cursor in a new tab
-- mapping for :norm to help comment/uncomment, see https://stackoverflow.com/a/23063140/378253
--map("", "<c-n>", ":norm") -- FIXME if this conflict with completion menu <c-n><c-p> then restrict to visual mode
-----> Normal mappings <------
map("n", "<leader>w", ":update<cr>")
map("n", "<c-w>t", ":tabe<cr>")
-- next / prev tab
map("n", "gb", "gT")
map("n", "gw", "gt")
-- key shortcuts
map('n', '<leader>ei3', ':tabe ~/.config/i3/config<cr>')
map('n', '<leader>evm', ':tabe ~/Sync/[M] Sys-admin/vim-memo.md<cr>')
map('n', '<leader>ewi', ':tabe ~/Sync/Freelance/workflow-improvement.md<cr>')
map('n', '<leader>ek', ':tabe ~/qmk_firmware/keyboards/centromere/keymaps/nimser/keymap.c<cr>')
--open help in a vsplit by default
--FIXME won't work with K and should use existing help buffer when one is open
--cnoreabbrev('help', 'vert help')
--cnoreabbrev('h', 'vert h')

M.set_telescope_mappings = function()
  local telescope = require('telescope')
  local telescope_builtin = require('telescope.builtin')
  map('n', '<leader>ff', require('setup.telescope.helpers').project_files, {desc="Find VC files / cwd files if no VC"})
  map('n', '<leader>en', function()
    telescope_builtin.find_files({cwd='~/.config/nvim/'})
  end, {desc="Edit neovim config"})
  map('n', '<leader>fh', function()
    telescope_builtin.find_files({cwd='~/', hidden=true})
  end, {desc="Search all (hidden) files in ~/"})
  map('n', '<leader>fs', function()
    telescope_builtin.find_files({cwd='~/Sync', hidden=true})
  end, {desc="Search all (hidden) files in ~/Sync"})
  map('n', '<leader>fbs', function()
    telescope.extensions.file_browser.file_browser({cwd='~/Sync', hidden=true, respect_gitignore=false})
  end, {desc="Browse anything (hidden) from ~/Sync"})
  map('n', '<leader>fbh', function()
    telescope.extensions.file_browser.file_browser({cwd='~/', hidden=true, respect_gitignore=false})
  end, {desc="Browse anything (hidden) from ~/"})
  map('n', '<leader>fbc', function()
    telescope.extensions.file_browser.file_browser({hidden=true, respect_gitignore=false})
  end, {desc="Browse anything (hidden) from cwd"})
  map('n', '<leader>fbf', function()
    telescope.extensions.file_browser.file_browser({files=true, hidden=true, respect_gitignore=false})
  end, {desc="Browse (hidden) files from cwd, including gitignored ones"})
  map('n', '<leader>fbd', function()
    telescope.extensions.file_browser.file_browser({files=false, hidden=true, respect_gitignore=true})
  end, {desc="Browse (hidden) folders from cwd"})
  map('n', '<leader>fbad', function()
    telescope.extensions.file_browser.file_browser({files=false, hidden=true, respect_gitignore=false})
  end, {desc="Browse (hidden) folders from cwd, including gitignored ones"})
  map('n', '<leader>lg', telescope_builtin.live_grep, {desc="Live grep (cwd)"})
  map('n', '<leader>gs', function()
    telescope_builtin.grep_string({shorten_path = true, word_match = "-w", only_sort_text = true, search = ''})
  end, {desc="Grep string in cwd"})
  map('n', '<leader>/', require('setup.telescope.helpers').curr_buf, {desc="Search current buffer"})
end

M.set_pounce_mappings = function()
  map("n", "<leader>?", "<cmd>PounceRepeat<CR>")
  map("v", "?", "<cmd>Pounce<CR>")
  map("o", "?", "<cmd>Pounce<CR>")
end

return M
