-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Helper function for mappings
local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true } -- set mappings to non-recursive by default
  if opts then options = vim.tbl_extend("force", options, opts) end
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

-- Add empty lines before and after cursor line
map("n", "<S-CR>", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>")
map("n", "<CR>", "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>")
-----> Command mappings and abbrevs <------
cnoreabbrev("W", "w")
-----> Multi-mode mappings <------
map("", "gf", "<c-w>gF") -- open the file under cursor in a new tab (considering line number in link)
map("", "gF", "<c-w>gf") -- open the file under cursor in a new tab (ignoring line numbers)
-----> Normal mappings <------
map("n", "<leader>w", ":update<cr>")
map("n", "<c-w>t", ":tabe<cr>")
-- next / prev tab
map("n", "gb", "gT")
map("n", "gw", "gt")
-- favorite files shortcuts
map("n", "<localleader>ei", ":tabe ~/.config/i3/config<cr>", { desc = "Edit i3 config" })
map("n", "<localleader>em", ":tabe ~/Sync/Sys-admin/vim-memo.md<cr>", { desc = "Edit vim memo" })
map("n", "<localleader>ew", ":tabe ~/Sync/Freelance/workflow-improvement.md<cr>", { desc = "Edit workflow improvements" })
map("n", "<localleader>ek", ":tabe ~/qmk_firmware/keyboards/centromere/keymaps/nimser/keymap.c<cr>", { desc = "Edit keyboard keymap file" })
-- print/copy current file path
map("n", "<localleader>p", function() print(vim.fn.expand("%:p")) end, { desc = "Print file path" })
map("n", "<localleader>yp", function() vim.fn.setreg("+", vim.fn.expand("%:p")) end, { desc = "Copy file path" })
-- Move Lines
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-Left>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })
-- Resize window using <S> + arrow keys
map("n", "<S-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
