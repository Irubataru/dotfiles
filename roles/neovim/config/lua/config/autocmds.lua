-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- NOTE: New files with empty filetype should be type "text"
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("empty_filetype", { clear = true }),
  callback = function()
    vim.schedule(function()
      if vim.bo.filetype == "" then
        vim.bo.filetype = "text"
      end
    end)
  end,
})

-- Files named Tiltfile should have filetype Tiltfile
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Tiltfile",
  callback = function()
    vim.bo.filetype = "tiltfile"
    vim.treesitter.language.register("starlark", "tiltfile")
  end,
})

-- Files with an extension .mdx should have filetype mdx
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.mdx",
  callback = function()
    vim.bo.filetype = "mdx"
  end,
})

-- Turn on autoformat for certain filetypes
local autoformat_ft = {
  "lua",
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "python",
}

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = autoformat_ft,
  callback = function()
    vim.b.autoformat = true
  end,
})

-- Set textwidth for certain filetypes
vim.api.nvim_create_autocmd({ "FileType", "BufRead", "BufNewFile" }, {
  pattern = { "markdown" },
  callback = function()
    vim.bo.textwidth = 80
  end,
})

vim.api.nvim_create_autocmd({ "FileType", "BufRead", "BufNewFile" }, {
  pattern = { "tex" },
  callback = function()
    vim.bo.textwidth = 120
  end,
})
