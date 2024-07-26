-- Latex specific keymaps

local wk = require("which-key")

wk.add({
  { "<leader>ll", "<cmd>VimtexCompile<cr>", desc = "Compile document" },
  noremap = true,
  silent = true,
})
