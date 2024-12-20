local M = {}

M.setup = function()
  -- Get snippet directory
  local config_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")

  -- Get all .lua files in the directory
  local files = vim.fn.globpath(config_dir, "*.lua", false, true)

  -- Load each file except init.lua itself
  for _, file in ipairs(files) do
    local filename = vim.fn.fnamemodify(file, ":t:r") -- Get the filename without extension
    if filename ~= "init" then
      require("config.snippets." .. filename)
    end
  end
end

return M
