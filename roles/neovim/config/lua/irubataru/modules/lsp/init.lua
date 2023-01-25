local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
}

M.dependencies = {
  -- Use Neovim as a language server to inject LSP diagnostics, code actions,
  -- and more via Lua.
  { "jose-elias-alvarez/null-ls.nvim" },

  require("irubataru.modules.lsp.mason"),

  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
      -- require("omega.modules.langs.lua")
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      -- require("omega.modules.langs.rust")
    end,
  },
}

M.config = function()
  local status_ok, lspconfig = pcall(require, "lspconfig")
  if not status_ok then
    return
  end

  local servers = {
    -- ansiblels = {},
    ccls = {},
    -- clangd = {},
    clojure_lsp = {},
    cssls = {},
    dockerls = {},
    eslint = {},
    html = {},
    jsonls = require("irubataru.modules.lsp.servers.jsonls").config,
    -- ltex = require("irubataru.lsp.servers.ltex").config,
    marksman = {},
    omnisharp = require("irubataru.modules.lsp.servers.omnisharp").config,
    pyright = {},
    r_language_server = {},
    rust_analyzer = {},
    sumneko_lua = require("irubataru.modules.lsp.servers.sumneko_lua").config,
    tailwindcss = require("irubataru.modules.lsp.servers.tailwindcss").config,
    texlab = {},
    tsserver = {},
    volar = {},
  }

  local on_attach = function(client, bufnr)
    require("irubataru.modules.lsp.highlighting").setup(client)
    require("irubataru.core.keymaps.lsp").setup(bufnr)

    -- require("irubataru.keymaps").register_lsp_keymaps(bufnr)

    if client.server_capabilities.documentSymbolProvider and client.name ~= "volar" then
      require("nvim-navic").attach(client, bufnr)
    end

    if servers[client.name] == nil then
      return
    end

    local post = servers[client.name].on_attach_post
    if post == nil then
      return
    end

    post(client, bufnr)
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  for server, server_options in pairs(servers) do
    local opts = vim.tbl_deep_extend("force", options, server_options or {})
    lspconfig[server].setup(opts)
  end

  require("irubataru.modules.lsp.diagnostics")
  require("irubataru.modules.lsp.null-ls").setup(options)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "lspinfo",
    callback = function()
      vim.api.nvim_win_set_config(0, { border = "rounded" })
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "lsp-installer",
    callback = function()
      vim.api.nvim_win_set_config(0, { border = "rounded" })
    end,
  })
end

return M