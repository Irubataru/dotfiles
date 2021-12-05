require('plugins.lsp.diagnostics')

local on_attach = function(client)
  require('lsp-status').on_attach(client)
  require('plugins.lsp.keymaps').setup()
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
  omnisharp = require('plugins.lsp.omnisharp').config,
  pyright = {},
  sumneko_lua = require('plugins.lsp.sumneko_lua').config,
  tsserver = {},
}

local lspconfig = require('lspconfig')
for server, config in pairs(servers) do

  lspconfig[server].setup(vim.tbl_deep_extend("force", {
    on_attach = on_attach
  }, config))

  local cfg = lspconfig[server]
  if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
    vim.notify(server .. ": cmd not found: " .. vim.inspect(cfg.cmd))
  end

end
