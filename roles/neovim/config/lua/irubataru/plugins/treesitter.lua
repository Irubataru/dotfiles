local treesitter_config = require("nvim-treesitter.configs")

treesitter_config.setup({
  ensure_installed = "all",
  ignore_install = { "" }, -- list of parsers to ignore installing
  highlight = {
    enable = true,
    disable = { "" }, -- list of languages that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,

    indent = {
      enable = true,
      disable = { "" }, -- list of languages not to indent for
    },
  },
})
