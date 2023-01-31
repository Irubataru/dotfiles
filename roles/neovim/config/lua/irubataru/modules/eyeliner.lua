-- 👀 Move faster with unique f/F indicators.

local M = {
  "jinh0/eyeliner.nvim",
  keys = { "f", "F", "t", "T" },
}

M.config = function()
  require("eyeliner").setup({
    highlight_on_key = true,
    dim = true,
  })
end

return M
