-- A task runner and job management plugin for Neovim

local M = {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerToggle" },
  keys = {
    { "<leader>rr", "<cmd>OverseerRun<cr>", desc = "Run a task" },
    { "<leader>rv", "<cmd>OverseerToggle<cr>", desc = "Toggle task status view" },
  },
}

M.config = function()
  local overseer = require("overseer")
  overseer.setup()

  overseer.register_template(require("irubataru.modules.overseer.templates.rust.build"))
  overseer.register_template(require("irubataru.modules.overseer.templates.rust.run"))
end

return M
