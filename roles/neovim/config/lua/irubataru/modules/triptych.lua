-- Directory browser plugin for Neovim, inspired by Ranger

local M = {
  "simonmclean/triptych.nvim",
  cmd = { "Triptych" },
  keys = {
    {
      "<leader>fF",
      function()
        require("triptych").toggle_triptych()
      end,
      desc = "Open file navigator",
    },
  },
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-tree/nvim-web-devicons", -- optional
  },
}

return M
