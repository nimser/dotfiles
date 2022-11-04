-- LSP config
local opts = { noremap=true, silent=true }
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(_, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
  -- TODO better LSP rename using quickfix: https://www.reddit.com/r/neovim/comments/tjzmnt/better_lsp_rename/
  -- FIXME vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.format, {async=true,buffer=0})
  -- FIXME gd doesn't work properly for lua requires
end
require('lspconfig')['tsserver'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
}
require('lspconfig')['svelte'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
}
require('lspconfig')['sumneko_lua'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

-- Telescope config
-- for reference, here's tjdevries' (author of telescope) config:
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/init.lua
-- also :help telescope.nvim is great!
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
-- mappings
local mappings = {}
mappings.curr_buf = function()
  local opt = require('telescope.themes').get_dropdown({
    previewer=false,
    winblend=40,
    sorting_strategy="ascending",
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
