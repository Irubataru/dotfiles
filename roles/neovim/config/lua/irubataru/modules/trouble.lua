-- 🚦 A pretty diagnostics, references, telescope results, quickfix and
-- location list to help you solve all the trouble your code is causing.

local M = {
  "folke/trouble.nvim",
  keys = {
    { "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", desc = "Document diagnostics" },
    { "<leader>xl", "<cmd>Trouble loclist<cr>", desc = "Location list" },
    { "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = "To quickfix list" },
    { "<leader>xt", "<cmd>Trouble todo<cr>", desc = "TODO items" },
    { "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
    { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Open diagnostics" },
  },
  cmd = {
    "Trouble",
    "TroubleClose",
    "TroubleToggle",
    "TroubleRefresh",
    "TodoTrouble",
  },
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  opts = {
    {
      mode = "document_diagnostics",
    },
  },
}

return M
