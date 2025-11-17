return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        ["*"] = {
          keys = {
            { "<leader>cr", false },
            { "<leader>rr", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
            { "<a-cr>", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
          },
        },
      },
    },
  },
}
