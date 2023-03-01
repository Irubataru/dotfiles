-- ✅ Highlight, list and search todo comments in your projects

local M = {
  "folke/todo-comments.nvim",
  event = "BufReadPost",
  cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble", "TodoTelescope" },
}

M.config = function()
  require("todo-comments").setup()
end

return M
