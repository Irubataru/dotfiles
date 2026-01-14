return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        djlsp = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "django-template-lsp" } },
  },
}
