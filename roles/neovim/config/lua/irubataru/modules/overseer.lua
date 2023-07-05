-- A task runner and job management plugin for Neovim

local M = {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerToggle" },
}

M.config = function()
  require("overseer").setup({
    templates = {
      "builtin",
      "user.rust.rust_build",
      "user.rust.rust_run",
    },
  })
end

return M
