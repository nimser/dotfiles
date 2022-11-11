-- Module mappings
local M = {}
M.curr_buf = function()
  local opt = require('telescope.themes').get_dropdown({
    previewer=false,
    winblend=40,
    sorting_strategy="ascending",
  })
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
M.project_files = function()
  local opts = {}
  local git_opts = {show_untracked=true}
  local in_git_repo = vim.fn.systemlist"git rev-parse --is-inside-work-tree"[1] == 'true'
  if in_git_repo then
    require("telescope.builtin").git_files(git_opts)
  else
    require("telescope.builtin").find_files(opts)
  end
end
return M
