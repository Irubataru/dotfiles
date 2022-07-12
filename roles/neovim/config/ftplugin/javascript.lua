----------------------------------
-- javascript specific settings --
----------------------------------

local keymap = vim.keymap.set

-- General settings
-- {{{
vim.wo.foldmethod = "syntax"
-- }}}

-- Keymaps
-- {{{
keymap('n', '<leader>cf', ':Autoformat<CR>', { noremap=true })
-- }}}

-- Various javascript conceals
-- {{{
vim.g.javascript_conceal_function   = "ƒ"
vim.g.javascript_conceal_null       = "ø"
vim.g.javascript_conceal_this       = "@"
vim.g.javascript_conceal_return     = "<"
vim.g.javascript_conceal_undefined  = "¿"
vim.g.javascript_conceal_NaN        = "ℕ"
vim.g.javascript_conceal_prototype  = "#"
vim.g.javascript_conceal_static     = "•"
vim.g.javascript_conceal_super      = "Ω"
-- }}}

-- Wrap the conceal characters to their expanded form
-- {{{
-- keymap('i', '<buffer>', '<silent> @ <C-r>=syntax_expand#expand("@", "this")<CR>', { noremap=true })
-- keymap('i', '<buffer>', '<silent> # <C-r>=syntax_expand#expand("#", "prototype")<CR>', { noremap=true })
keymap('i', '<buffer>', '<silent> < <C-r>=syntax_expand#expand_head("<", "return")<CR>', { noremap=true })
-- }}}
