-- DAP adapters and configurations for C and C++

local M = {}

local mason_path = vim.fn.stdpath("data") .. "/mason"

M.adapters = {
  cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = mason_path .. "/bin/OpenDebugAD7",
    options = {
      detached = false,
    },
  },
}

M.configurations = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
  {
    name = "Attach to gdbserver :1234",
    type = "cppdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
  },
}

M.setup = function()
  local dap = require("dap")
  dap.adapters.cppdbg = M.adapters.cppdbg
  dap.configurations.cpp = M.configurations
  dap.configurations.c = M.configurations
end

return M
