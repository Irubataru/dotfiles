-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- FIX: This doesn't work, runs LSP in telescope prompt
-- NOTE: New files with empty filetype should be type "text"
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("empty_filetype", { clear = true }),
--   callback = function()
--     if vim.bo.filetype == "" then
--       vim.bo.filetype = "text"
--     end
--   end,
-- })

-- Turn on autoformat for certain filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua" },
  callback = function()
    vim.b.autoformat = true
  end,
})
