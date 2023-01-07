-- A small Neovim plugin for previewing definitions using floating windows.

local M = {
  "rmagatti/goto-preview",
}

M.config = function()
  require("goto-preview").setup({})
end

return M
