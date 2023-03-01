return {
  -- Create Neovim themes with real-time feedback, export anywhere.
  { "rktjmp/lush.nvim" },

  -- 🌈 Plugin that creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin LSP client.
  {
    "folke/lsp-colors.nvim",
    event = "VeryLazy",
  },

  -- 🌳 Low-contrast Vim color scheme based on Seoul Colors
  {
    "junegunn/seoul256.vim",
    event = "VeryLazy",
    priority = 10,
  },

  -- 🏙️ A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins.
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- TODO find a better way to handle this currently have a race condition
      -- with other UI plugins if I don't set the coloursceme first
      vim.cmd([[colorscheme tokyonight-storm]])
    end,
  },

  -- A simple and pretty pink colorscheme for Neovim made with Lush.
  {
    "scysta/pink-panic.nvim",
    event = "VeryLazy",
    priority = 10,
  },

  -- A dark and light Neovim theme written in fennel, inspired by IBM Carbon.
  {
    "nyoom-engineering/oxocarbon.nvim",
    event = "VeryLazy",
    priority = 10,
  },

  -- NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.
  {
    "rebelot/kanagawa.nvim",
    event = "VeryLazy",
    priority = 10,
  },

  -- Low-contrast calm color scheme for Vim
  {
    "rhysd/vim-color-spring-night",
    event = "VeryLazy",
    priority = 10,
  },

  -- A 24bit colorscheme for Vim, Airline and Lightline
  {
    "jacoborus/tender.vim",
    event = "VeryLazy",
    priority = 10,
  },

  -- 🗡️ Warm colorscheme for Neovim and beyond
  {
    "savq/melange",
    event = "VeryLazy",
    priority = 10,
  },

  -- 🪨 A collection of contrast-based Vim/Neovim colorschemes
  {
    "mcchrish/zenbones.nvim",
    event = "VeryLazy",
    priority = 10,
  },

  -- 🦊 A highly customizable theme for vim and neovim with support for lsp, treesitter and a variety of plugins.
  {
    "EdenEast/nightfox.nvim",
    event = "VeryLazy",
    priority = 10,
  },

  -- 🌑 Neovim theme inspired by material palenight.
  {
    "JoosepAlviste/palenightfall.nvim",
    event = "VeryLazy",
    priority = 10,
  },

  --- 🍨 Soothing pastel theme for (Neo)vim
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VeryLazy",
    priority = 10,
  },
}
