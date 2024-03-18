return {
  -- Vastly improved Javascript indentation and syntax support in Vim.
  { "pangloss/vim-javascript", ft = { "javascript" } },

  -- Expand characters to code if not in a comment or string
  { "Olical/vim-syntax-expand", ft = { "javascript" } },

  -- A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
  { "elzr/vim-json", ft = { "json" } },

  -- A Neovim Lua plugin providing access to the SchemaStore catalog.
  { "b0o/schemastore.nvim" },

  -- Turn messy and confusing TypeScript errors into plain English.
  { "dmmulroy/ts-error-translator.nvim", config = true, ft = { "typescript", "vue" } },
}
