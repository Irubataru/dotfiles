local M = {}

M.is_loaded = function(plugin)
  -- Check if the plugin is installed
  if not require("lazy.core.config").plugins[plugin] then
    return false
  end

  -- Check if the plugin is loaded
  if require("lazy.core.config").plugins[plugin]._.loaded then
    return true
  end

  return false
end

return M
