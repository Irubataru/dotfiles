local keymap = vim.api.nvim_set_keymap
keymap('n', '<leader>ll', '<cmd>VimtexCompile<cr>', { noremap = true })
keymap('n', '<leader>tt', '<cmd>VimtexTocToggle<cr>', { noremap = true })

vim.g.vimtex_fold_enabled = 1
vim.g.vimtex_view_method = "zathura"
vim.g.tex_conceal="abdgm"
