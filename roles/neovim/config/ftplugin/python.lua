------------------------------
-- python specific settings --
------------------------------

local keymap = vim.api.nvim_set_keymap

-- UI
-- {{{

vim.bo.tabstop=4
vim.bo.softtabstop=4
vim.bo.shiftwidth=4
vim.bo.textwidth=79
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.fileformat = "unix"

vim.g.formatters_python = {'yapf'}

-- }}}

-- Keymaps
-- {{{

-- autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
keymap('n', '<F5>', ':AsyncRun -raw python %<CR>', { noremap=true, silent = true })
keymap('n', '<leader>cf', ':Autoformat<CR>', { noremap=true })

-- }}}
