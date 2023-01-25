-- Populate the quickfix with json entries

local M = {
  "gennaro-tedesco/nvim-jqx",
  cmd = { "JqxList", "JqxQuery" },
  ft = { "json" },
}

M.config = function()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "jqx",
    command = [[set syntax=json]]
  })
end

return M
