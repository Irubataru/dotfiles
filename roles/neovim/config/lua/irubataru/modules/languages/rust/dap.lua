-- DAP adapters and configurations for Rust

local M = {}

M.setup = function()
  local dap = require("dap")
  dap.configurations.rust = require("irubataru.modules.languages.cpp.dap").configurations
end

return M
