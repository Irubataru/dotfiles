return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        ltex = {
          settings = {
            ltex = {
              diagnosticSeverity = "error",
              checkFrequency = "save",
            },
          },
        },
      })
    end,
  },
}
