require("goto-preview").setup({
})

local m = require("mapx")
m.nnoremap("gD", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", { silent = true })
