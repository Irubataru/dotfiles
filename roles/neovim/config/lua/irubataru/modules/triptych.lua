-- Directory browser plugin for Neovim, inspired by Ranger

local M = {
  "simonmclean/triptych.nvim",
  cmd = { "Triptych" },
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-tree/nvim-web-devicons", -- optional
  },
}

return M
