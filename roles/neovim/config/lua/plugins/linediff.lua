local keymap = vim.api.nvim_set_keymap

keymap('v', '<leader>da', ':Linediff<CR>', { noremap=true, silent = true })
keymap('n', '<leader>dr', ':LinediffReset<CR>', { noremap=true, silent = true })
