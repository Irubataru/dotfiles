require("lazy").setup("irubataru.modules", {
  defaults = {
    lazy = true,
  },
  diff = {
    cmd = "git",
  },
  install = {
    colorscheme = {
      require("irubataru.core.colours").scheme.name,
      "tokyonight",
      "kanagawa",
    },
  },
  performance = {
    rtp = {
      paths = {
        vim.fn.stdpath("config"),
      },
      disabled_plugins = {
        "loaded_python3_provider",
        "python_provider",
        "node_provider",
        "ruby_provider",
        "perl_provider",
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "tar",
        "tarPlugin",
        "rrhelper",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "logiPat",
        "netrwSettings",
        "netrwFileHandlers",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
        "load_ftplugin",
        "indent_on",
        "netrwPlugin",
        "tohtml",
        "man",
      },
    },
  },
  change_detection = {
    enabled = false,
  },
})
