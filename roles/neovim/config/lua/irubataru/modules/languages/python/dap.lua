
local M = {}

M.setup = function()

  local python_path = os.getenv("HOME") .. "/.local/share/venv/debugpy/bin/python"

  require("dap-python").setup(python_path)

end

return  M
