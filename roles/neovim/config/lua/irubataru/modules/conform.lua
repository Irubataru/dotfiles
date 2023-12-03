-- Lightweight yet powerful formatter plugin for Neovim

local M = {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
}

M.config = function()
  require("conform").setup({
    formatters_by_ft = {
      clojure = { "zprint", "cljstyle" },
      html = { "eslint_d", "prettierd" },
      javascript = { "eslint_d", "prettierd" },
      lua = { "stylua" },
      python = { "isort", "black" },
      tex = { "latexindent" },
      typescript = { "eslint_d", "prettierd" },
      vue = { "eslint_d", "prettierd" },
    },
    formatters = {
      stylua = {
        prepend_args = { "--config-path", vim.fn.expand("~/.config/stylua/stylua.toml") },
      },
    },
  })
end

return M
