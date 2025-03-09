return {
  {
    "folke/snacks.nvim",
    keys = require("config.mappings").set_snacks_mappings(),
    opts = {
      picker = {
        hidden = true,
      },
    },
  },
}
