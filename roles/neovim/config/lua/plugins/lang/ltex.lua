local enabled = false

if not enabled then
  return {}
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      vim.print(opts.servers.ltex)
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        ltex = {
          filetypes = {
            "bib",
            "plaintex",
            "tex",
          },
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
