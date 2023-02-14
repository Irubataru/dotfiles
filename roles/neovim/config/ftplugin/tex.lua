-- LaTeX specific settings

local keymap = vim.keymap.set

vim.opt.smartindent = true
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab = true
vim.opt.textwidth=80
vim.opt.conceallevel=2
vim.g.SuperTabDefaultCompletionType = '<C-x><C-o>'

-- Use vimtex for folding
vim.opt.foldexpr = "vimtex#fold#level(v:lnum)"

-- Set spelling by default
vim.bo.spelllang="en_gb"
