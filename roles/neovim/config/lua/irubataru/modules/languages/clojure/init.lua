return {
  require("irubataru.modules.languages.clojure.conjure"),
  require("irubataru.modules.languages.clojure.vim-jack-in"),

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
