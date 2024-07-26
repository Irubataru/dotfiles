-- A vim plugin to perform diffs on blocks of code

local M = {
  "AndrewRadev/linediff.vim",
  cmd = { "Linediff", "LinediffReset" },
  keys = {
    { "<leader>da", "<cmd>Linediff<cr>", desc = "Linediff add" },
  },
}

return M
