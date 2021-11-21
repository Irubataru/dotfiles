-- C specific settings

local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>rf', ':set foldlevel=0<CR>', { noremap=true })
keymap('n', '<leader>rF', ':set foldlevel=1<CR>', { noremap=true })

vim.opt.foldmethod="syntax"
vim.opt.foldlevelstart=0
vim.opt.foldlevel=0

-- vim.cmd [[let &colorcolumn="80,".join(range(120,999),",")]]
