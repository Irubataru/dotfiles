local keymap = vim.api.nvim_set_keymap

keymap('n', '<Leader>gg', ':aboveleft 16split|0Git<CR>', { noremap=true, silent = true })
keymap('n', '<Leader>gc', ':Gcommit<CR>', { noremap=true, silent = true })
keymap('n', '<Leader>gd', ':Gdiff<CR>', { noremap=true, silent = true })

vim.cmd([[
if has("autocmd")
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif
]])
