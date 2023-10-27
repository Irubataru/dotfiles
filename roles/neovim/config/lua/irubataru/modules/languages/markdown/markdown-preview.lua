-- markdown preview plugin for (neo)vim

local M = {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npx --yes yarn install",
  ft = { "markdown" },
}

M.setup = function()
  vim.g.mkdp_filetypes = { "markdown" }
  vim.g.mkdp_auto_close = 0
end

return M
