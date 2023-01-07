-- Standalone UI for nvim-lsp progress

local M = {
  "j-hui/fidget.nvim",
  event = "LspAttach",
}

M.config = function()
    require("fidget").setup({})
end

return M
