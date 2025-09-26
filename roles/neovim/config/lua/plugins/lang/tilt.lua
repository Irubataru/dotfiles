return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tilt_ls = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "starlark" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "tilt" } },
  },
}
