-- autopairs for neovim written by lua

local M = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
}

M.config = function()
  require("nvim-autopairs").setup({})
end

return M
