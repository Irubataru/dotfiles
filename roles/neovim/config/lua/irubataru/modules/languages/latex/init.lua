return {
  require("irubataru.modules.languages.latex.vimtex"),

  -- This plugin extends the Conceal feature of Vim for LaTeX.
  {
    "KeitaNakamura/tex-conceal.vim",
    ft = { "tex" },
  },
}
