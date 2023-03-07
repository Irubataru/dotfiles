-- Debug Adapter Protocol client implementation for Neovim

local M = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
  },
}

M.config = function()
  require("dap.ext.vscode").load_launchjs()

  -- TODO: Loop over languages in languages directory
  require("irubataru.modules.languages.cpp.dap").setup()
  require("irubataru.modules.languages.python.dap").setup()
  require("irubataru.modules.languages.rust.dap").setup()

  -- Load any .vscode/launch.json file with extra configs

  -- table.insert(require("dap").configurations.python, {
  --   type = "python",
  --   request = "launch",
  --   name = "Kongsberg use-case",
  --   module = "kongsberg",
  -- })

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
