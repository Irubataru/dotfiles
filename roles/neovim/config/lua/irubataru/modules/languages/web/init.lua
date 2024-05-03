return {
  -- Vastly improved Javascript indentation and syntax support in Vim.
  { "pangloss/vim-javascript", ft = { "javascript" } },

  -- Expand characters to code if not in a comment or string
  { "Olical/vim-syntax-expand", ft = { "javascript" } },

  -- Turn messy and confusing TypeScript errors into plain English.
  { "dmmulroy/ts-error-translator.nvim", config = true, ft = { "typescript", "vue" } },
}
