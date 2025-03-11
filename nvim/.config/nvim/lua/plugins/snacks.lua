---@diagnostic disable: missing-fields
local function browse_modules_folder(mode)
  local root = LazyVim.root.get()
  -- NOTE: only node support for now
  local node_modules_path = root .. "/node_modules"

  -- Check if node_modules exists
  if vim.fn.isdirectory(node_modules_path) == 1 then
    if mode == "files" then
      Snacks.picker.files({ title = "node_module files", cwd = node_modules_path, follow = true, no_ignore = true })
    elseif mode == "grep" then
      Snacks.picker.grep({ title = "node_module grep", cwd = node_modules_path, follow = true, no_ignore = true })
    else
      Snacks.explorer({ title = "node_module grep", cwd = node_modules_path, follow = true, no_ignore = true })
    end
  else
    vim.notify("No node_modules folder found in project root", vim.log.levels.WARN)
  end
end

return {
  "folke/snacks.nvim",
  opts = {

    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
    picker = {
      hidden = true,
      sources = {
        explorer = {
          win = {
            list = {
              keys = {
                ["o"] = "confirm",
                ["O"] = "explorer_open", -- open with system application
              },
            },
          },
        },
      },
    },
  },
  keys = {
    -- invert Root Dir / cwd trigger logic (small caps for cwd, caps for Root Dir). A
    { "<leader>fF", function() Snacks.picker.files({ cwd = LazyVim.root() }) end, desc = "Find Files (Root Dir)" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files (cwd)" },
    { "<leader>sG", function() Snacks.picker.grep({ cwd = LazyVim.root() }) end, desc = "Grep (Root Dir)" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep (cwd)" },
    { "<leader>sW", function() Snacks.picker.grep_word({ cwd = LazyVim.root() }) end, desc = "Visual selection or word (Root Dir)", mode = { "n", "x" } },
    { "<leader>fE", function() Snacks.explorer({ cwd = LazyVim.root() }) end, desc = "Browse (Root dir)" },
    { "<leader>fe", function() Snacks.explorer() end, desc = "Browse (cwd)" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word (cwd)", mode = { "n", "x" } },

    -- Switch from Root Dir to cwd for these
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep (cwd)" },
    { "<leader><space>", function() Snacks.picker.files() end, desc = "Find Files (cwd)" },

    -- remaps
    { "<leader>fn", LazyVim.pick.config_files(), desc = "Find Neovim Config File" },

    -- location-specific shortcuts
    --- project modules
    { "<localleader>fm", function() browse_modules_folder("files") end, desc = "Find file in project module deps" },
    { "<localleader>gm", function() browse_modules_folder("grep") end, desc = "Grep in project module deps" },
    { "<localleader>fem", function() browse_modules_folder("explorer") end, desc = "Browse in project module deps" },
    --- Home
    { "<localleader>fh", function() Snacks.picker.files({ cwd = "~/" }) end, desc = "Find files in ~/" },
    { "<localleader>gh", function() Snacks.picker.grep({ cwd = "~/" }) end, desc = "Grep in ~/" },
    { "<localleader>feh", function() Snacks.explorer({ cwd = "~/" }) end, desc = "Browse ~/" },
    --- neovim
    { "<localleader>fsn", function() Snacks.picker.files({ cwd = "~/.local/share/nvim/" }) end, desc = "Find files in ~/.local/share/nvim/" },
    { "<localleader>gsn", function() Snacks.picker.grep({ cwd = "~/.local/share/nvim/" }) end, desc = "Grep in ~/.local/share/nvim/" },
    { "<localleader>fesn", function() Snacks.explorer({ cwd = "~/.local/share/nvim/" }) end, desc = "Grep in ~/.local/share/nvim/" },
    --- pnpm
    { "<localleader>fsp", function() Snacks.picker.files({ cwd = "~/.local/share/pnpm/" }) end, desc = "Find files in ~/.local/share/pnpm/" },
    { "<localleader>gsp", function() Snacks.picker.grep({ cwd = "~/.local/share/pnpm/" }) end, desc = "Grep in ~/.local/share/pnpm/" },
    { "<localleader>fesp", function() Snacks.explorer({ cwd = "~/.local/share/pnpm/" }) end, desc = "Grep in ~/.local/share/pnpm/" },
    --- ~/.local/share
    { "<localleader>fs", function() Snacks.picker.files({ cwd = "~/.local/share/" }) end, desc = "Find files in ~/.local/share/" },
    { "<localleader>gs", function() Snacks.picker.grep({ cwd = "~/.local/share/" }) end, desc = "Grep in ~/.local/share/" },
    { "<localleader>fes", function() Snacks.explorer({ cwd = "~/.local/share/" }) end, desc = "Grep in ~/.local/share/" },
    --- ~/Sync
    { "<localleader>fS", function() Snacks.picker.files({ cwd = "~/Sync/" }) end, desc = "Find files in ~/Sync/" },
    { "<localleader>gS", function() Snacks.picker.grep({ cwd = "~/Sync/" }) end, desc = "Grep in ~/Sync/" },
    { "<localleader>feS", function() Snacks.explorer({ cwd = "~/Sync/" }) end, desc = "Browse ~/code" },
    --- ~/code
    { "<localleader>fc", function() Snacks.picker.files({ cwd = "~/code/" }) end, desc = "Find files in ~/code" },
    { "<localleader>gc", function() Snacks.picker.grep({ cwd = "~/code/" }) end, desc = "Grep in ~/code/" },
    { "<localleader>fec", function() Snacks.explorer({ cwd = "~/code/" }) end, desc = "Browse ~/code/" },
  },
}
