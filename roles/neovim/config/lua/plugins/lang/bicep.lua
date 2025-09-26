return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bicep = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "bicep" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "bicep-lsp" } },
  },
}
