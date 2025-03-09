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
map("n", "<leader>ei3", ":tabe ~/.config/i3/config<cr>")
map("n", "<leader>evm", ":tabe ~/Sync/Sys-admin/vim-memo.md<cr>")
map("n", "<leader>ewi", ":tabe ~/Sync/Freelance/workflow-improvement.md<cr>")
map("n", "<leader>ek", ":tabe ~/qmk_firmware/keyboards/centromere/keymaps/nimser/keymap.c<cr>")
--open help in a vsplit by default
--FIXME won't work with K and should use existing help buffer when one is open
--cnoreabbrev('help', 'vert help')
--cnoreabbrev('h', 'vert h')

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
--
-- Resize window using <S> + arrow keys
map("n", "<S-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- PLUGINS mappings
local M = {}
M.set_snacks_mappings = function()
  -- local function dependency for browsing project modules
  local function browse_modules_folder()
    local root = LazyVim.root.get()
    local node_modules_path = root .. "/node_modules"

    -- Check if node_modules exists
    if vim.fn.isdirectory(node_modules_path) == 1 then
      LazyVim.pick("files", {
        prompt_title = "Node Modules",
        cwd = node_modules_path,
        hidden = true,
        no_ignore = true,
      })()
    else
      vim.notify("No node_modules folder found in project root", vim.log.levels.WARN)
    end
  end
  ---@diagnostic disable: missing-fields
  return {
    -- invert Root Dir / cwd trigger logic (small caps for cwd, caps for Root Dir). A
    { "<leader>fF", function() Snacks.picker.files({ cwd = LazyVim.root() }) end, desc = "Find Files (Root Dir)" },
    { "<leaderff", function() Snacks.picker.files() end, desc = "Find Files (cwd)" },
    { "<leader>sG", function() Snacks.picker.grep({ cwd = LazyVim.root() }) end, desc = "Grep (Root Dir)" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep (cwd)" },
    { "<leader>sW", function() Snacks.picker.grep_word({ cwd = LazyVim.root() }) end, desc = "Visual selection or word (Root Dir)", mode = { "n", "x" } },
    { "<leader>fE", function() Snacks.explorer({ cwd = LazyVim.root() }) end, desc = "Browse (Root dir)" },
    { "<leader>fe", function() Snacks.explorer() end, desc = "Browse (cwd)" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word (cwd)", mode = { "n", "x" } },

    -- Switch from Root Dir to cwd for these
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep (cwd)" },
    { "<leader><space>", function() Snacks.picker.files() end, desc = "Find Files (cwd)" },

    -- location-specific shortcuts
    { "<leader>fh", function() Snacks.picker.files({ cwd = "~/" }) end, desc = "Find files in ~/" },
    { "<leader>feh", function() Snacks.explorer({ cwd = "~/" }) end, desc = "Browse ~/" },
    { "<localleader>fc", function() Snacks.picker.files({ cwd = "~/code" }) end, desc = "Find files in ~/code" },
    { "<localleader>fec", function() Snacks.explorer({ cwd = "~/code" }) end, desc = "Browse ~/code" },
    { "<localleader>fsn", function() Snacks.picker.files({ cwd = "~/.local/share/nvim/" }) end, desc = "Find files in ~/.local/share/nvim/" },
    { "<localleader>fsp", function() Snacks.picker.files({ cwd = "~/.local/share/pnpm/" }) end, desc = "Find files in ~/.local/share/pnpm/" },
    { "<localleader>fs", function() Snacks.picker.files({ cwd = "~/.local/share/" }) end, desc = "Find files in ~/.local/share/" },

    -- remaps
    { "<leader>fn", LazyVim.pick.config_files(), desc = "Find Neovim Config File" },
    { "<localleader>fm", browse_modules_folder, desc = "Find in module" },
  }
end
return M
