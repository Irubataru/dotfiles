-- Neovim plugin for a code outline window

local M = {
  "stevearc/aerial.nvim",
  cmd = { "AerialOpen", "AerialToggle" },
}

M.config = function()
  require("aerial").setup({
    filter_kind = false,
  })
end

return M
