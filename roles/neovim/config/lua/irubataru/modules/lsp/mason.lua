-- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.

local M = {
  "williamboman/mason.nvim",
  cmd = {"Mason"}
}

M.config = function()
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })
end

return M
