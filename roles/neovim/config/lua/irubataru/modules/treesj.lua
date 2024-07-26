-- Neovim plugin for splitting/joining blocks of code

local M = {
  "Wansmer/treesj",
  cmd = { "TSJJoin", "TSJSplit", "TSJToggle" },
  keys = {
    { "<leader>cc", "<cmd>TSJToggle<cr>", desc = "Toggle split/join" },
    { "<leader>cj", "<cmd>TSJJoin<cr>", desc = "Join content" },
    { "<leader>cs", "<cmd>TSJSplit<cr>", desc = "Split content" },
  },
  opts = {},
}

return M
