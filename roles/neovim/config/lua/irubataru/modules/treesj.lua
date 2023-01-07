-- Neovim plugin for splitting/joining blocks of code

local M = {
  "Wansmer/treesj",
  cmd = { "TSJJoin", "TSJSplit", "TSJToggle" },
}

M.config = function()
  require("treesj").setup({})
end

return M
