return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        astro = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "astro" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "astro-language-server" } },
  },
}
