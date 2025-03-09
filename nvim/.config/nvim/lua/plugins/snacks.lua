return {

  -- change some telescope options and a keymap to browse plugin files
  {
    "folke/snacks.nvim",
    keys = require("config.keymaps").set_snacks_mappings(),
  },
}
