-- Latex specific keymaps

local wk = require("which-key")
local leader_opts = { noremap = true, silent = true, prefix = "<Leader>" }

wk.register({
  ll = { "<cmd>VimtexCompile<cr>", "Compile document" },
}, leader_opts)
