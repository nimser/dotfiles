-- for reference, here's tjdevries' (author of telescope) config:
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/init.lua
local telescope = require("telescope")

telescope.setup({
  defaults = {
    -- We use table.insert above because `hidden = true` is not supported in text grep commands.
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--hidden",
      "--smart-case"
    },
    prompt_prefix = ' ',
  },

  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      -- NOTE: the steam-related folders were created symlinks loops with the follow=true option
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
-- mappings
local mappings = {}
mappings.curr_buf = function()
  local opt = require('telescope.themes').get_dropdown({
    previewer=false,
    winblend=40,
    sorting_strategy=ascending,
  })
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
mappings.project_files = function()
  local opts = {}
  local git_opts = {show_untracked=true}
  local in_git_repo = vim.fn.systemlist"git rev-parse --is-inside-work-tree"[1] == 'true'
  if in_git_repo then
    require("telescope.builtin").git_files(git_opts)
  else
    require("telescope.builtin").find_files(opts)
  end
end
return mappings
