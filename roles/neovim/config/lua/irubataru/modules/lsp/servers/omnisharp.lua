local pid = vim.fn.getpid()
local omnisharp_bin = "omnisharp"

-- Fix for https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
local function fix_semantic_tokens(client)
  client.server_capabilities.semanticTokensProvider.legend = {
    tokenModifiers = { "static" },
    tokenTypes = {
      "comment",
      "excluded",
      "identifier",
      "keyword",
      "keyword",
      "number",
      "operator",
      "operator",
      "preprocessor",
      "string",
      "whitespace",
      "text",
      "static",
      "preprocessor",
      "punctuation",
      "string",
      "string",
      "class",
      "delegate",
      "enum",
      "interface",
      "module",
      "struct",
      "typeParameter",
      "field",
      "enumMember",
      "constant",
      "local",
      "parameter",
      "method",
      "method",
      "property",
      "event",
      "namespace",
      "label",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "xml",
      "regexp",
      "regexp",
      "regexp",
      "regexp",
      "regexp",
      "regexp",
      "regexp",
      "regexp",
      "regexp",
    },
  }
end

local M = {}

M.config = {
  on_attach_post = function(client, _)
    fix_semantic_tokens(client)
  end,
  -- cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
  cmd = { omnisharp_bin },
  filetypes = { "cs", "vb" },

  -- Set defaults to off so that we can configure them ourselves
  enable_editorconfig_support = false,
  sdk_include_prereleases = false,
}

return M
