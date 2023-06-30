local M = {
  -- ansiblels = {},
  bashls = {},
  ccls = {},
  -- clangd = {},
  clojure_lsp = {},
  cssls = {},
  dockerls = {},
  eslint = {},
  html = {},
  jsonls = require("irubataru.modules.lsp.servers.jsonls").config,
  -- ltex = require("irubataru.lsp.servers.ltex").config,
  lua_ls = require("irubataru.modules.lsp.servers.lua_ls").config,
  marksman = {},
  omnisharp = require("irubataru.modules.lsp.servers.omnisharp").config,
  pyright = {},
  -- r_language_server = {},
  tailwindcss = require("irubataru.modules.lsp.servers.tailwindcss").config,
  texlab = {},
  tsserver = {},
  volar = {},
}

return M