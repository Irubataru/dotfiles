-- A vim plugin to display the indention levels with thin vertical lines

local M = {
  "Yggdroot/indentLine",
  ft = { "python" },
}

M.config = function()
  vim.g.indentLine_enabled = 1
  vim.g.indentLine_setConceal = 0
end

return M
