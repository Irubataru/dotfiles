require("nvim-lsp-installer").setup({})

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local servers = {
  ansiblels = {},
  ccls = {},
  -- clangd = {},
  clojure_lsp = {},
  dockerls = {},
  eslint = {},
  jsonls = require("irubataru.lsp.servers.jsonls").config,
  ltex = require("irubataru.lsp.servers.ltex").config,
  marksman = {},
  omnisharp = require("irubataru.lsp.servers.omnisharp").config,
  pyright = {},
  r_language_server = {},
  sumneko_lua = require("irubataru.lsp.servers.sumneko_lua").config,
  tailwindcss = require("irubataru.lsp.servers.tailwindcss").config,
  texlab = {},
  tsserver = {},
}

local on_attach = function(client, bufnr)
  require("irubataru.lsp.highlighting").setup(client)
  require("irubataru.keymaps").register_lsp_keymaps(bufnr)

  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
}

for server, server_options in pairs(servers) do
  local opts = vim.tbl_deep_extend("force", options, server_options or {})
  lspconfig[server].setup(opts)
end

require("irubataru.lsp.diagnostics")
require("irubataru.lsp.null-ls").setup(options)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

vim.api.nvim_create_autocmd("FileType",{
  pattern = "lspinfo",
  callback = function()
    vim.api.nvim_win_set_config(0, { border = "rounded" })
  end
})

vim.api.nvim_create_autocmd("FileType",{
  pattern = "lsp-installer",
  callback = function()
    vim.api.nvim_win_set_config(0, { border = "rounded" })
  end
})