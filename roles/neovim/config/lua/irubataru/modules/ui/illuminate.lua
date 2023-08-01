-- Vim plugin for automatically highlighting other uses of the word under the cursor. Integrates with Neovim's LSP client for intelligent highlighting.

local M = {
  "RRethy/vim-illuminate",
  event = "CursorHold",
  enabled = false,
}

M.config = function()
  vim.g.Illuminate_delay = 1000
end

return M
