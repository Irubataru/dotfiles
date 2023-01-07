-- Zoom-in Like a Boss, How? Layout-Preserving Zoomer weighing in 🪶

local M = {
  "nyngwang/NeoZoom.lua",
}

M.config = function()
  require("neo-zoom").setup({
    left_ratio = 0.0,
    top_ratio = 0.0,
    width_ratio = 1.0,
    height_ratio = 1.0,
    border = "none",
  })
end

return M
