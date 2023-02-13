-- Telescope config
-- for reference, here's tjdevries' (author of telescope) config:
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/init.lua
-- Cool tips:
-- - refine your search over the live_grep results in a fuzzy environment after pressing <c-space>
-- also :help telescope.nvim is great!
local telescope = require("telescope")
local Path = require "plenary.path"
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    -- We use table.insert above because `hidden = true` is not supported in text grep commands.
    prompt_prefix = ' ',
    --path_display = { shorten = { len = 2, exclude = {1,-1}} }, -- customize path display
  },

  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      -- NOTE: the steam-related folders were created symlinks loops with the follow=true option
      -- look at ~/.config/fd/ignore for files globally ignored by fd
      find_command = {
        "fd",
        "--type",
        "file",
        "--type",
        "symlink",
        "--exclude",
        ".git",
        "--exclude",
        "node_modules",
        "--exclude",
        ".steam/**",
        "--exclude",
        ".local/share/Steam/**",
      },
      attach_mappings = function(prompt_bufnr, map)
        map("n", "<Leader>b", function(_)
          local new_cwd = Path:new(vim.loop.cwd())
          actions.close(prompt_bufnr)
          -- FIXME cwd value not pointing to right dir. this is BROKEN
          telescope.extensions.file_browser.file_browser({cwd=new_cwd:absolute()})
        end)
        return true
      end,
      -- NOTE can also use find_command picker functions instead as follows (here using wildignore):
      --find_command = function()
      --  local command = { "fd", "--type", "f" }
      --  for _, ignore_pattern in pairs(vim.opt.wildignore:get()) do
      --    table.insert(find_command, "--exclude")
      --    table.insert(find_command, ignore_pattern)
      --  end
      --  return command
      --end
    },
  },
})
telescope.load_extension('fzf')
telescope.load_extension('file_browser')
-- import telescope related keyboard mappings
require('mappings').set_telescope_mappings()

