local keymap = vim.api.nvim_set_keymap

-- Replace yank with flashy-yank that highlights yanked area
keymap('n', 'y', '<Plug>(operator-flashy)', {})
keymap('n', 'Y', '<Plug>(operator-flashy)$', {})

-- yy seems to be broken
-- https://github.com/haya14busa/vim-operator-flashy/issues/12
-- TODO find alternative
keymap('n', 'yy', 'yy', {})
