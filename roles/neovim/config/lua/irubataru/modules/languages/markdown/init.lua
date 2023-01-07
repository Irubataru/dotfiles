return {

  require("irubataru.modules.languages.markdown.mkdx"),
  require("irubataru.modules.languages.markdown.markdown-preview"),

  -- A markdown preview directly in your neovim.
  {
    "npxbr/glow.nvim",
    cmd = "Glow",
    ft = { "markdown" },
  },
}

