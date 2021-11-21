local nvim_tree = require('nvim-tree')
nvim_tree.setup {}

local keymap = vim.api.nvim_set_keymap
keymap('', '<C-N>', ':NvimTreeToggle<CR>', {})
