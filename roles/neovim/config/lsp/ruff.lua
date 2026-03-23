---@type vim.lsp.Config
return {
  cmd_env = { RUFF_TRACE = "messages" },
  init_options = {
    settings = {
      logLevel = "error",
    },
  },
  keys = {
    {
      "<leader>co",
      LazyVim.lsp.action["source.organizeImports"],
      desc = "Organize Imports",
    },
  },
}
