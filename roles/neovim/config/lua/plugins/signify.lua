local keymap = vim.api.nvim_set_keymap

keymap('n', '<Leader>ss', ':SignifyToggle<CR>', { noremap=true, silent = true })
