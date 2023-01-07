-- Neovim plugin to stabilize window open/close events.

local M = {
  "luukvbaal/stabilize.nvim",
}

M.config = function()
  require("stabilize").setup()
end

return M
