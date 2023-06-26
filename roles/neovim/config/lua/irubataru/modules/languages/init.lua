return {
  require("irubataru.modules.languages.cpp"),
  require("irubataru.modules.languages.rust"),
  require("irubataru.modules.languages.python"),
  require("irubataru.modules.languages.clojure"),
  require("irubataru.modules.languages.latex"),
  require("irubataru.modules.languages.web"),
  require("irubataru.modules.languages.markdown"),

  -- A matlab plugin for vim, includes syntax highlighting, correct indention and so on.
  {
    "lazywei/vim-matlab",
    ft = { "matlab" },
  },

  -- Mathematica syntax highlighting (and more) for vim
  {
    "rsmenon/vim-mathematica",
    ft = { "mathematica" },
  },

  -- Syntax highlighting for Gnuplot
  {
    "vim-scripts/gnuplot.vim",
    ft = { "gnuplot" },
  },

  -- An up-to-date jinja2 syntax file.
  {
    "Glench/Vim-Jinja2-Syntax",
    ft = { "jinja2" },
  },

  -- Vim plugin to work with R
  {
    "jalvesaq/Nvim-R",
    ft = { "R" },
  },

  -- vim plugin for tmux.conf
  {
    "tmux-plugins/vim-tmux",
    ft = { "tmux" },
  },
}
