-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","

-- make all keymaps silent by default
local keymap_set = vim.keymap.set
---@diagnostic disable-next-line: duplicate-set-field
vim.keymap.set = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  return keymap_set(mode, lhs, rhs, opts)
end

vim.o.list = false
vim.o.startofline = true

-- Do not autoformat on save
vim.g.autoformat = false

-- LazyVim picker to use.
-- Can be one of: telescope, fzf, snacks
-- Leave it to "auto" to automatically use the picker
-- enabled with `:LazyExtras`
vim.g.lazyvim_picker = "snacks"

-- Python
vim.g.lazyvim_python_lsp = "basedpyright"

-- Prettier
vim.g.lazyvim_prettier_needs_config = true

-- Eslint
vim.g.lazyvim_eslint_auto_format = false
