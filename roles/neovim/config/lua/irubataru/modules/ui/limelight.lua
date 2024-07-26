-- Hyperfocus-writing in Vim

local M = {
  "junegunn/limelight.vim",
  cmd = { "Limelight" },
  keys = {
    { "<C-y>", ":Limelight!!<CR>", desc = "Toggle limelight mode" },
  },
}

return M
