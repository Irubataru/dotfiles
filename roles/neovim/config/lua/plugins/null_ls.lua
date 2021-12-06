local null_ls = require("null-ls")

null_ls.config({
  sources = {
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua.with({
      extra_args = { "--config-path", vim.fn.expand("~/.config/stylua/stylua.toml") },
    }),
  }
})

require("lspconfig")["null-ls"].setup({})

local keymap = vim.api.nvim_set_keymap
keymap('n', "<leader>cf", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>", {noremap = true})
