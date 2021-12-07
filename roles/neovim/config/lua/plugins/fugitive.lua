local m = require('mapx')

m.nnoremap('<Leader>gg', ':aboveleft 16split|0Git<CR>', {silent = true})
m.nnoremap('<Leader>gc', ':Gcommit<CR>', {silent = true})
m.nnoremap('<Leader>gc', ':Gdiffsplit<CR>', {silent = true})

vim.cmd([[
if has("autocmd")
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif
]])
