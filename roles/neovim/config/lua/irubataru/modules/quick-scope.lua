-- Highlighting for f,F,t,T

local M = {
  "unblevable/quick-scope",
  keys = { "f", "F", "t", "T" },
}

M.config = function()
  vim.g.qs_buftype_blacklist = { "terminal", "nofile" }
end

return M
