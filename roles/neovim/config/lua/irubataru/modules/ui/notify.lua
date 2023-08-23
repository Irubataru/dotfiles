-- A fancy, configurable, notification manager for NeoVim,

local M = {
  "rcarriga/nvim-notify",
  enable = false
}

M.config = function()
  vim.notify = require("notify")
end

return M
