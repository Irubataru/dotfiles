local M = {
  "code-biscuits/nvim-biscuits",
}

M.config = function()
  require("nvim-biscuits").setup({
    cursor_line_only = true,
    show_on_start = false,
  })
end

return M
