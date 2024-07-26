-- ✅ Highlight, list and search todo comments in your projects

local M = {
  "folke/todo-comments.nvim",
  event = "BufReadPost",
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODO items" },
  },
  cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble", "TodoTelescope" },
  opts = {},
}

M.config = function()
  require("todo-comments").setup()
end

return M
