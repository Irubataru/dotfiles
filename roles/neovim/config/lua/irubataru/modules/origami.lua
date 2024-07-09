-- Fold with relentless elegance.

local M = {
  "chrisgrieser/nvim-origami",
  event = "BufReadPost",
}

M.config = function()
  require("origami").setup({})
  vim.o.startofline = true
end

return M
