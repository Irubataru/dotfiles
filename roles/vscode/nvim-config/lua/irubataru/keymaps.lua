local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "[b", "<cmd>tabprev<cr>", opts)

vim.cmd[[
nnoremap [b <cmd>tabprev<cr>
nnoremap ]b <cmd>tabnext<cr>
]]
