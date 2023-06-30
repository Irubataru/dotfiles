-- A neovim plugin that helps managing crates.io dependencies

local M = {
  "Saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
}

M.config = function()
  require("crates").setup({
    null_ls = {
      enabled = true,
      name = "crates.nvim",
    },
  })
end

-- Set up Cargo completion lazily
vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
  pattern = "Cargo.toml",
  callback = function()
    require("cmp").setup.buffer({ sources = { { name = "crates" } } })
  end,
})

return M
