-- Notes specific settings

local keymap = vim.keymap.set

vim.opt.textwidth=100
vim.opt.spell = true

-- Navigate to other notes with the \gt keybinding
keymap('v', '<Leader>gt', ':NoteFromSelectedText<CR>', { noremap=true })
keymap('n', '<Leader>gt', 'viw:NoteFromSelectedText<CR>', { noremap=true })
keymap('n', '<Leader>ff', ':set foldlevel=0<CR>zA', { noremap=true })

-- Set set a short timeout for mappings
vim.opt.timeoutlen=300

-- Setting up quick mapping of the greek alphabet
keymap('i', '\\a', 'α', { noremap = true, buffer = true })
keymap('i', '\\b', 'β', { noremap = true, buffer = true })
keymap('i', '\\c', 'χ', { noremap = true, buffer = true })
keymap('i', '\\d', 'δ', { noremap = true, buffer = true })
keymap('i', '\\e', 'ε', { noremap = true, buffer = true })
keymap('i', '\\f', 'φ', { noremap = true, buffer = true })
keymap('i', '\\g', 'γ', { noremap = true, buffer = true })
keymap('i', '\\h', 'η', { noremap = true, buffer = true })
keymap('i', '\\k', 'κ', { noremap = true, buffer = true })
keymap('i', '\\l', 'λ', { noremap = true, buffer = true })
keymap('i', '\\m', 'μ', { noremap = true, buffer = true })
keymap('i', '\\n', 'ν', { noremap = true, buffer = true })
keymap('i', '\\p', 'π', { noremap = true, buffer = true })
keymap('i', '\\q', 'θ', { noremap = true, buffer = true })
keymap('i', '\\r', 'ρ', { noremap = true, buffer = true })
keymap('i', '\\s', 'σ', { noremap = true, buffer = true })
keymap('i', '\\t', 'τ', { noremap = true, buffer = true })
keymap('i', '\\u', 'υ', { noremap = true, buffer = true })
keymap('i', '\\w', 'ω', { noremap = true, buffer = true })
keymap('i', '\\x', 'ξ', { noremap = true, buffer = true })
keymap('i', '\\y', 'ψ', { noremap = true, buffer = true })
keymap('i', '\\z', 'ζ', { noremap = true, buffer = true })
keymap('i', '\\D', 'Δ', { noremap = true, buffer = true })
keymap('i', '\\E', 'ϵ', { noremap = true, buffer = true })
keymap('i', '\\F', 'Φ', { noremap = true, buffer = true })
keymap('i', '\\G', 'Γ', { noremap = true, buffer = true })
keymap('i', '\\L', 'Λ', { noremap = true, buffer = true })
keymap('i', '\\W', 'Ω', { noremap = true, buffer = true })
keymap('i', '\\Q', 'Θ', { noremap = true, buffer = true })
keymap('i', '\\S', 'Σ', { noremap = true, buffer = true })
keymap('i', '\\X', 'Ξ', { noremap = true, buffer = true })
keymap('i', '\\Y', 'Ψ', { noremap = true, buffer = true })
keymap('i', '\\8', '∞', { noremap = true, buffer = true })
keymap('i', '\\!', '≠', { noremap = true, buffer = true })
keymap('i', '\\<', '≤', { noremap = true, buffer = true })
keymap('i', '\\>', '≥', { noremap = true, buffer = true })
keymap('i', '\\.', '·', { noremap = true, buffer = true })
keymap('i', '\\N', '∇', { noremap = true, buffer = true })
