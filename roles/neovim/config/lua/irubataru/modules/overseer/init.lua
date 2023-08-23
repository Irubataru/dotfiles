-- A task runner and job management plugin for Neovim

local M = {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerToggle" },
}

M.config = function()
  local overseer = require("overseer")
  overseer.setup()

  overseer.register_template(require("irubataru.modules.overseer.templates.rust.build"))
  overseer.register_template(require("irubataru.modules.overseer.templates.rust.run"))
end

return M
