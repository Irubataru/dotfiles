-- Tools for better development in rust using neovim's builtin lsp
-- NOTE: This module is loaded by lsp, do not load it explicitly

local M = {
  "simrat39/rust-tools.nvim",
  ft = { "rust" },
  dependencies = {
    "mfussenegger/nvim-dap",
  },
}


M.config = function()
  local rt = require("rust-tools")
  rt.setup({
    server = {
      on_attach = function(_, bufnr)
        require("irubataru.core.keymaps.lsp").setup(bufnr)
      end,
    },
    dap = {
      adapter = require("irubataru.modules.dap.adapters").adapters.codelldb
    }
  })
end

return M
