---------------------------
-- C++ specific settings --
---------------------------

local keymap = vim.keymap.set

-- UI
-- {{{
vim.opt.foldmethod="syntax"
vim.opt.foldlevelstart=0
vim.opt.foldlevel=0

-- vim.cmd [[let &colorcolumn="80,".join(range(120,999),",")]]

-- vim.opt.tabstop = 2
-- vim.opt.expandtab = true
-- vim.opt.shiftwidth = 2
-- }}}

-- Keymaps
-- {{{

keymap('n', '<leader>rf', ':set foldlevel=0<CR>', { noremap=true })
keymap('n', '<leader>rF', ':set foldlevel=1<CR>', { noremap=true })
keymap('n', '<leader>ll', ':Make<CR>', { noremap=true })
keymap('n', '<leader>LL', ':Make!<CR>', { noremap=true })

-- vim-clang-format
-- {{{
vim.cmd [[autocmd FileType c,cpp nnoremap <buffer><Leader>= :<C-u>ClangFormat<CR>]]
vim.cmd [[autocmd FileType c,cpp vnoremap <buffer><Leader>= :ClangFormat<CR>]]
-- }}}

-- }}}
