-- LaTeX specific settings

local keymap = vim.api.nvim_set_keymap

vim.opt.smartindent = true
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab = true
vim.opt.textwidth=80
vim.opt.conceallevel=2
vim.g.SuperTabDefaultCompletionType = '<C-x><C-o>'

vim.bo.spelllang="en_gb"

-- Keymaps
-- {{{

-- nnoremap <Leader>ll :Latexmk<CR>
-- nnoremap <Leader>lv :LatexView<CR>
-- nnoremap <Leader>lf :LatexFold<CR>
-- nnoremap <Leader>lt :LatexTOC<CR>

keymap('n', '<leader>cf', ':Autoformat<CR>', { noremap=true })

-- }}}
