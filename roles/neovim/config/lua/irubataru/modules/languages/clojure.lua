return {
  -- Interactive evaluation for Neovim (Clojure, Fennel, Janet, Racket, Hy, MIT Scheme, Guile)
  {
    "Olical/conjure",
    ft = { "clojure" },
  },

  -- vim-sexp mappings for regular people
  {
    "tpope/vim-sexp-mappings-for-regular-people",
    ft = { "clojure" },
    dependencies = {
      -- Precision Editing for S-expressions
      {
        "guns/vim-sexp",
        ft = { "clojure" },
      },
    },
  },
}
