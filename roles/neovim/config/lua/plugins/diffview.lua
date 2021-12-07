local m = require('mapx')

m.nnoremap('<Leader>gD', ':DiffviewFileHistory<CR>', {silent = true})
m.nnoremap('<Leader>gG', ':DiffviewOpen<CR>', {silent = true})
