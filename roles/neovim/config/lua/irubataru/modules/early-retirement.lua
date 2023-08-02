-- Send buffers into early retirement by automatically closing them after x minutes of inactivity.

local M = {
  "chrisgrieser/nvim-early-retirement",
  event = "VeryLazy",
  enabled = false
}

M.config = function()
  require("early-retirement").setup({})
end

return M
