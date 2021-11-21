local keymap = vim.api.nvim_set_keymap

keymap('n', '<C-y>', ':Limelight!!<CR>', { noremap=true, silent = true })
