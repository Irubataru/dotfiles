return {
  require("irubataru.modules.languages.clojure"),
  require("irubataru.modules.languages.cpp"),
  require("irubataru.modules.languages.json"),
  require("irubataru.modules.languages.latex"),
  require("irubataru.modules.languages.lua"),
  require("irubataru.modules.languages.markdown"),
  require("irubataru.modules.languages.python"),
  require("irubataru.modules.languages.rust"),
  require("irubataru.modules.languages.web"),

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

  -- Filetype detection an syntax support for Jinja templates.
  {
    "HiPhish/jinja.vim",
    ft = { "jinja", "jinja2", "*.jinja", "*.jinja2" },
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
