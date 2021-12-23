require('plugins.lsp.diagnostics')

local on_attach = function(client)
  require('lsp-status').on_attach(client)
  require('plugins.lsp.highlighting').setup(client)
  require('plugins.lsp.code_lens').setup(client)
end

local servers = {
  ccls = {},
  -- clangd = {},
  clojure_lsp = {},
  dockerls = {},
  eslint = {},
  jsonls = require('plugins.lsp.jsonls').config,
  ltex = require('plugins.lsp.ltex').config,
  omnisharp = require('plugins.lsp.omnisharp').config,
  pyright = {},
  sumneko_lua = require('plugins.lsp.sumneko_lua').config,
  texlab = {},
  tsserver = {},
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local options = {
  on_attach = on_attach,
  capabilities = capabilities
}

require("plugins.lsp.null-ls").setup(options)
require("plugins.lsp.install").setup(servers, options);

require("plugins.lsp.global-keymaps")
