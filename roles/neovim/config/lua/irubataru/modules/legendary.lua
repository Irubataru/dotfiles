-- 🗺️ A legend for your keymaps, commands, and autoc

local M = {
  "mrjones2014/legendary.nvim",
  dependencies = {
    { "kkharji/sqlite.lua" },
  },
  cmd = { "Legendary" },
  keys = {
    { "<leader>fC", "<cmd>Legendary commands<cr>", desc = "Find commands" },
    { "<leader>fk", "<cmd>Legendary keymaps<cr>", desc = "Find keymaps (legendary)" },
  },
}

return M
