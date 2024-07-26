local M = {
  "code-biscuits/nvim-biscuits",
  keys = {
    {
      "<leader>cb",
      function()
        require("nvim-biscuits").toggle_biscuits()
      end,
      desc = "Toggle biscuits",
    },
  },
  opts = {
    cursor_line_only = true,
    show_on_start = false,
  },
}

M.config = function()
  require("nvim-biscuits").setup({
    cursor_line_only = true,
    show_on_start = false,
  })
end

return M
