local M = {}

--- Returns the relative path from an absolute path
--- @param absolute string? The absolute path to convert
--- @return string
M.relative_path = function(absolute)
  -- Use the path of the current buffer if absolute isn't provided
  if absolute == nil then
    -- Get the current buffer number
    local bufnr = vim.api.nvim_get_current_buf()

    -- Get the name (path) of the buffer
    absolute = vim.api.nvim_buf_get_name(bufnr)
  end

  -- Return empty string if the buffer has no name (e.g., new unsaved buffer)
  if absolute == "" then
    return ""
  end

  local relative = vim.fn.fnamemodify(absolute, ":.")
  if string.sub(relative, 0, 1) == "/" then
    return vim.fn.fnamemodify(absolute, ":t")
  end
  return relative
end

return M
