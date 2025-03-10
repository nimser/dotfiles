return {
  "folke/which-key.nvim",
  opts_extend = { "spec" },
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        require("config.keymaps").set_whichkey_group_names(),
      },
    },
  },
}
