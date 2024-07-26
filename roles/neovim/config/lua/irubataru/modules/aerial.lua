-- Neovim plugin for a code outline window

local M = {
  "stevearc/aerial.nvim",
  cmd = { "AerialOpen", "AerialToggle" },
  keys = {

    { "gs", "<cmd>AerialToggle<cr>", desc = "Symbols (aerial)" },
  },
  opts = {
    filter_kind = false,
  },
}

return M
