-- A task runner and job management plugin for Neovim

local M = {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerToggle" }
}

M.config = function()
  require("overseer").setup({})
end

return M
