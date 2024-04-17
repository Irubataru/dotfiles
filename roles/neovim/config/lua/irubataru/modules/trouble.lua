-- 🚦 A pretty diagnostics, references, telescope results, quickfix and
-- location list to help you solve all the trouble your code is causing.

local M = {
  "folke/trouble.nvim",
  cmd = {
    "Trouble",
    "TroubleClose",
    "TroubleToggle",
    "TroubleRefresh",
    "TodoTrouble",
  },
}

M.dependencies = {
  { "nvim-tree/nvim-web-devicons" },
}

M.config = function()
  require("trouble").setup({
    mode = "document_diagnostics",
  })
end

return M
