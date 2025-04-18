local M = {}

--- Returns the buffer number of the buffer that matches filetype and name
--- @param filetype string? The filetype, does not check filetype if nil
--- @param name string? The name, does not check name if nil
--- @return integer? ID of the buffer, nil if no buffer matches the search
M.find_buffer = function(filetype, name)
  local window_id = nil
  for _, window in pairs(vim.api.nvim_list_wins()) do
    local buffer = vim.api.nvim_win_get_buf(window)
    local buffer_filetype = vim.api.nvim_get_option_value("filetype", { buf = buffer })
    local buffer_name = vim.api.nvim_buf_get_name(buffer)

    local has_same_ft = not filetype or buffer_filetype == filetype
    local has_same_name = not name or buffer_name:match(name)

    if has_same_ft and has_same_name then
      window_id = window
      break
    end
  end

  return window_id
end

return M
