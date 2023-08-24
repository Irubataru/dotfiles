-- An Nvim lua plugin that dims your inactive windows

local M = {
  "sunjon/Shade.nvim",
  event = "VeryLazy",
}

M.config = function()
  require("shade").setup({
    overlay_opacity = 50,
  })
end

return M
