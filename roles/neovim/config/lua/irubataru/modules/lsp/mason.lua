-- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.

local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  cmd = { "Mason" },
}

M.config = function()
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })

  local server_configs = require("irubataru.modules.lsp.servers")

  local servers = {}
  for server, _ in pairs(server_configs) do
    table.insert(servers, server)
  end

  require("mason-lspconfig").setup({
    ensure_installed = servers,
  })
end

return M
