-- Rearrange your windows with ease.

local M = {
  "sindrets/winshift.nvim",
  cmd = { "WinShift" },
  keys = {
    { "<leader>ww", "<cmd>WinShift<cr>", desc = "Enter Win-Move mode" },
    { "<C-h>", "<cmd>WinShift left<cr>", desc = "Move window left" },
    { "<C-j>", "<cmd>WinShift down<cr>", desc = "Move window down" },
    { "<C-k>", "<cmd>WinShift up<cr>", desc = "Move window up" },
    { "<C-l>", "<cmd>WinShift right<cr>", desc = "Move window right" },
    { "<C-W>m", "<cmd>WinShift<cr>", desc = "Enter Win-Move mode" },
  },
  opts = {},
}

M.config = function()
  require("winshift").setup()
end

return M
