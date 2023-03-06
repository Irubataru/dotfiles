-- A UI for nvim-dap

local M = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
}

M.config = function()
  require("dapui").setup()
end

return M
