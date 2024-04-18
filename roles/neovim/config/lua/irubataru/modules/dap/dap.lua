-- Debug Adapter Protocol client implementation for Neovim

local M = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "LiadOz/nvim-dap-repl-highlights"
  },
}

M.config = function()
  require("dap.ext.vscode").load_launchjs()

  -- Syntax highlighting in DAP REPL
  require('nvim-dap-repl-highlights').setup()

  -- Set up adapters
  require("irubataru.modules.dap.adapters").setup()

  -- TODO: Loop over languages in languages directory
  require("irubataru.modules.languages.cpp.dap").setup()
  require("irubataru.modules.languages.python.dap").setup()
  require("irubataru.modules.languages.rust.dap").setup()

  local dap = require("dap")
  dap.listeners.after.event_initialized["dap_keybinds"] = function()
    require("irubataru.core.keymaps.dap").bind()
  end
  dap.listeners.before.event_terminated["dap_keybinds"] = function()
    require("irubataru.core.keymaps.dap").unbind()
  end
  dap.listeners.before.event_exited["dap_keybinds"] = function()
    require("irubataru.core.keymaps.dap").unbind()
  end

  require("dapui")
end

return M
