-- Some color utils for neovim

local M = {
  "max397574/colortils.nvim",
  cmd = "Colortils",
}

M.config = function()
  require("colortils").setup({})
end

return M
