local M = {}

-- TODO This needs some work
-- https://neovim.discourse.group/t/reload-init-lua-and-all-require-d-scripts/971/11
function M.reload()

  local plenary_reload = require("plenary.reload").reload_module

  for name, _ in pairs(package.loaded) do
    if name:match("^irubataru%.") then
      plenary_reload(name)
    end
  end

  dofile(vim.env.MYVIMRC)

end

function M.get_file_directory()
  local file_dir = vim.fn.expand("%:p:h")
  local vim_wd = vim.fn.getcwd()

  if file_dir == vim_wd then
    return ""
  else
    return file_dir:gsub(vim_wd .. "/", "") .. "/"
  end
end

return M
