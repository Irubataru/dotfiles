-- Recall refines the use of Neovim marks by focusing on global marks, streamlining their usage and enhancing their visibility and navigability.

local M = {
  "fnune/recall.nvim",
  opts = {
    telescope = {
      autoload = false,
    },
  },
}

return M
