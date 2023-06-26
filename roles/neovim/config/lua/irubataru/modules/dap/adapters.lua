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
  codelldb = {
    id = "codelldb",
    type = "server",
    port = "${port}",
    executable = {
      command = mason_path .. "/packages/codelldb/codelldb",
      args = {
        "--liblldb",
        mason_path .. "/packages/codelldb/extension/lldb/lib/liblldb.so",
        "--port",
        "${port}",
      },
    },
  },
}

M.setup = function()
  local dap = require("dap")
  dap.adapters.cppdbg = M.adapters.cppdbg
  dap.adapters.codelldb = M.adapters.codelldb
end

return M
