return {
  "folke/flash.nvim",
  keys = require("config.keymaps").set_snacks_mappings(),
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
