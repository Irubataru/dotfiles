local M = {
  "kylechui/nvim-surround",
  keys = { "ys", "ds", "cs" },
}

M.config = function()
  require("nvim-surround").setup({})
end

return M
