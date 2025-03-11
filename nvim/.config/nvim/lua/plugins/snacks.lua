local function browse_modules_folder(mode)
  local root = LazyVim.root.get()
  local node_modules_path = root .. "/node_modules"

  -- Check if node_modules exists
  if vim.fn.isdirectory(node_modules_path) == 1 then
    if mode == "files" then
      Snacks.picker.files({ title = "node_module files", cwd = node_modules_path, follow = true, no_ignore = true })
    else
      Snacks.picker.grep({ title = "node_module grep", cwd = node_modules_path, follow = true, no_ignore = true })
    end
  else
    vim.notify("No node_modules folder found in project root", vim.log.levels.WARN)
  end
end

---@diagnostic disable: missing-fields
return {
  "folke/snacks.nvim",
  keys = {
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

    -- remaps
    { "<leader>fn", LazyVim.pick.config_files(), desc = "Find Neovim Config File" },

    -- location-specific shortcuts
    { "<leader>fh", function() Snacks.picker.files({ cwd = "~/" }) end, desc = "Find files in ~/" },
    { "<leader>feh", function() Snacks.explorer({ cwd = "~/" }) end, desc = "Browse ~/" },
    { "<localleader>fc", function() Snacks.picker.files({ cwd = "~/code" }) end, desc = "Find files in ~/code" },
    { "<localleader>fec", function() Snacks.explorer({ cwd = "~/code" }) end, desc = "Browse ~/code" },
    { "<localleader>fsn", function() Snacks.picker.files({ cwd = "~/.local/share/nvim/" }) end, desc = "Find files in ~/.local/share/nvim/" },
    { "<localleader>gn", function() Snacks.picker.grep({ cwd = "~/.local/share/nvim/" }) end, desc = "Grep in ~/.local/share/nvim/" },
    { "<localleader>fsp", function() Snacks.picker.files({ cwd = "~/.local/share/pnpm/" }) end, desc = "Find files in ~/.local/share/pnpm/" },
    { "<localleader>gp", function() Snacks.picker.grep({ cwd = "~/.local/share/pnpm/" }) end, desc = "Grep in ~/.local/share/pnpm/" },
    { "<localleader>fs", function() Snacks.picker.files({ cwd = "~/.local/share/" }) end, desc = "Find files in ~/.local/share/" },
    { "<localleader>fm", function() browse_modules_folder("files") end, desc = "Find file in project module deps" },
    { "<localleader>gm", function() browse_modules_folder("grep") end, desc = "Grep in project module deps" },
  },
  specs = {
    {
      "folke/snacks.nvim",
      opts = {
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
    },
  },
}
