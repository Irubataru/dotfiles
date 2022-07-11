require('irubataru.lsp.diagnostics')

local on_attach = function(client)
  -- require('lsp-status').on_attach(client)
  require('irubataru.lsp.highlighting').setup(client)
end

local servers = {
  ansiblels = {},
  ccls = {},
  -- clangd = {},
  clojure_lsp = {},
  dockerls = {},
  eslint = {},
  jsonls = require('irubataru.lsp.jsonls').config,
  ltex = require('irubataru.lsp.ltex').config,
  omnisharp = require('irubataru.lsp.omnisharp').config,
  pyright = {},
  r_language_server = {},
  sumneko_lua = require('irubataru.lsp.sumneko_lua').config,
  tailwindcss = {},
  texlab = {},
  tsserver = {},
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local options = {
  on_attach = on_attach,
  capabilities = capabilities
}

require'lspconfig'.r_language_server.setup(options);

require("irubataru.lsp.null-ls").setup(options)
require("irubataru.lsp.install").setup(servers, options);

require("irubataru.lsp.global-keymaps")
