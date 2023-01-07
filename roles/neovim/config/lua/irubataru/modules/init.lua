return {
  -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
  { "nvim-lua/plenary.nvim" },

  { "antoinemadec/FixCursorHold.nvim" },

  -- Enable repeating supported plugin maps with .
  { "tpope/vim-repeat" },

  -- quoting/parenthesizing made simple
  { "tpope/vim-surround" },

  -- Pairs of handy bracket mappings
  { "tpope/vim-unimpaired" },

  -- Asynchronous build and test dispatcher
  { "tpope/vim-dispatch" },

  -- Disable arrow movement, update to takac/vim-hardtime eventually
  { "wikitopian/hardmode" },
}

-- Plugin graveyard
-- {{{

-- Just annoying, at least how it works now, window gets stuck
-- use({ -- ray-x/lsp_signature.nvim
--   "ray-x/lsp_signature.nvim", -- LSP signature hint as you type
-- })

-- Nothing seems to happen when I use it
-- use({ -- mvllow/modes.nvim
--   "mvllow/modes.nvim",
--   config = function()
--     require('modes').setup({
--       set_cursor = true,
--       set_cursorline = true,
--       set_number = true,
--     })
--   end
-- })

-- Doesn't work as well as I wont, need to revisit
-- use({ -- beauwilliams/focus.nvim
--   "beauwilliams/focus.nvim",
--   config = function()
--     require("irubataru.plugins.focus")
--   end,
-- })

-- Breaks other pop-ups like Mason
-- use({ -- sunjon/shade.nvim
--   "sunjon/shade.nvim",
--   config = function()
--     require("shade").setup({
--       overlay_opacity = 70,
--       opacity_step = 5,
--     })
--   end,
-- })

-- use { "glepnir/template.nvim", config = configs.template } -- Quickly insert templates into file

-- Doesn't work in its current state, trying aerial.nvim instead
-- use({ -- simrat39/symbols-outline.nvim
--   "simrat39/symbols-outline.nvim", -- A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
--   config = function()
--     require("symbols-outline").setup({
--       highlight_hovered_item = true,
--       show_guides = true
--
--     })
--   end,
-- })

-- DAP
-- {{{

-- use { "mfussenegger/nvim-dap" }
-- use { "theHamsta/nvim-dap-virtual-text" }
-- use { "rcarriga/nvim-dap-ui" }

-- }}}

-- Clojure support
-- {{{

-- use { 'tpope/vim-fireplace', ft = { 'clojure' } } -- Clojure REPL support
-- use { 'guns/vim-clojure-static', ft = { 'clojure' } } -- Meikel Brandmeyer's excellent Clojure runtime files
-- use { 'guns/vim-clojure-highlight', ft = { 'clojure' } } -- Extend builtin syntax highlighting to referred and aliased vars in Clojure buffers
-- use { 'vim-scripts/paredit.vim', ft = { 'clojure' } } -- Paredit Mode: Structured Editing of Lisp S-expressions
-- use { 'venantius/vim-cljfmt', ft = { 'clojure' } } -- A Vim plugin for cljfmt, the Clojure formatting tool.

-- }}}

-- }}}
