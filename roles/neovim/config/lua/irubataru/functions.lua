local M = {}

-- TODO This needs some work
-- https://neovim.discourse.group/t/reload-init-lua-and-all-require-d-scripts/971/11
function M.reload()
  local plenary = require("plenary.reload")
  plenary.reload_module("")
  dofile(vim.env.MYVIMRC)
end

return M
