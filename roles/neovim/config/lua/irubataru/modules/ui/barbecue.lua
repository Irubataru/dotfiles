-- A VS Code like winbar for Neovim

local M = {
  "utilyre/barbecue.nvim",
  event = "VeryLazy",
}

M.dependencies = {
  -- Simple winbar/statusline plugin that shows your current code context
  { "SmiteshP/nvim-navic" },
  { "nvim-tree/nvim-web-devicons" },
}

M.config = function()
  require("barbecue").setup({
    separator = "  ",
  })
  vim.api.nvim_set_hl(0, "NavicSeparator", { default = false, link = "Normal" })
end

return M
