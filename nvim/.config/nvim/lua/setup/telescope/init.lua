-- Telescope config
-- for reference, here's tjdevries' (author of telescope) config:
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/init.lua
-- Cool tips:
-- - refine your search over the live_grep results in a fuzzy environment after pressing <c-space>
-- also :help telescope.nvim is great!
local telescope = require("telescope")

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
      attach_mappings = function(_, map)
        map("n", "<Leader>c", function(prompt_bufnr)
          local selection = require("telescope.actions.state").get_selected_entry()
          local dir = vim.fn.fnamemodify(selection.path, ":p:h")
          require("telescope.actions").close(prompt_bufnr)
          -- Depending on what you want put `cd`, `lcd`, `tcd`
          vim.cmd(string.format("silent lcd %s", dir))
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

