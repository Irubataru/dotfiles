return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp")
    end,
    event = "VeryLazy",
  },
  {
    "Saghen/blink.cmp",
    dependencies = {
      "Saghen/blink.compat",
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = true,
  },
}
