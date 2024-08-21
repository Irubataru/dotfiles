local M = {}

M.is_loaded = function(plugin)
  if require("lazy.core.config").plugins[plugin]._.loaded then
    return true
  end

  return false
end

return M
