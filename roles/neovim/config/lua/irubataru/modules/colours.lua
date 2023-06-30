local colorscheme = require("irubataru.core.colours").scheme

-- Set the priority of the loading so it matches the current selected theme
local function scheme(key, cfg)
  if key == colorscheme.id then
    cfg.lazy = false
    cfg.priority = 1000
  else
    cfg.event = "VeryLazy"
    cfg.priority = 10
  end

  return cfg
end

return {
  -- Create Neovim themes with real-time feedback, export anywhere.
  { "rktjmp/lush.nvim" },

  -- 🌈 Plugin that creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin LSP client.
  {
    "folke/lsp-colors.nvim",
    event = "VeryLazy",
  },

  -- 🌳 Low-contrast Vim color scheme based on Seoul Colors
  scheme("seoul256", {
    "junegunn/seoul256.vim",
    config = function()
      -- Set the terminal colors missing from the seoul256 colour scheme
      -- NOTE: This will only work if it is set as the default colour scheme
      if colorscheme.name == "seoul256" then
        vim.g.terminal_color_0 = "#4e4e4e"
        vim.g.terminal_color_1 = "#d68787"
        vim.g.terminal_color_2 = "#5f865f"
        vim.g.terminal_color_3 = "#d8af5f"
        vim.g.terminal_color_4 = "#85add4"
        vim.g.terminal_color_5 = "#d7afaf"
        vim.g.terminal_color_6 = "#87afaf"
        vim.g.terminal_color_7 = "#d0d0d0"
        vim.g.terminal_color_8 = "#626262"
        vim.g.terminal_color_9 = "#d75f87"
        vim.g.terminal_color_10 = "#87af87"
        vim.g.terminal_color_11 = "#ffd787"
        vim.g.terminal_color_12 = "#add4fb"
        vim.g.terminal_color_13 = "#ffafaf"
        vim.g.terminal_color_14 = "#87d7d7"
        vim.g.terminal_color_15 = "#e4e4e4"

        -- Floating window colours
        vim.api.nvim_set_hl(0, "NormalFloat", { ctermfg = 252, ctermbg = 237, guifg = "#d0d0d0", guibg = "#3a3a3a" })
        vim.api.nvim_set_hl(0, "Float", { ctermfg = 252, ctermbg = 237, guifg = "#d0d0d0", guibg = "#3a3a3a" })
        vim.api.nvim_set_hl(0, "FloatBorder", { ctermfg = 252, ctermbg = 237, guifg = "#d0d0d0", guibg = "#3a3a3a" })

        -- No status line colours, hidden witen lualine not active
        vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = 237, ctermbg = 237, guifg = "#3a3a3a", guibg = "#3a3a3a" })

        -- The linenr and gutter should have same bg as the rest
        vim.api.nvim_set_hl(0, "LineNr", { ctermbg = 237, guibg = "#3a3a3a" })
        vim.api.nvim_set_hl(0, "GitGutterAdd", { ctermbg = 237, guibg = "#3a3a3a" })
        vim.api.nvim_set_hl(0, "GitGutterChange", { ctermbg = 237, guibg = "#3a3a3a" })
        vim.api.nvim_set_hl(0, "GitGutterDelete", { ctermbg = 237, guibg = "#3a3a3a" })
        vim.api.nvim_set_hl(0, "GitGutterChangeDelete", { ctermbg = 237, guibg = "#3a3a3a" })
      end
    end,
  }),

  -- 🏙️ A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins.
  scheme("tokyonight", { "folke/tokyonight.nvim" }),

  -- A simple and pretty pink colorscheme for Neovim made with Lush.
  scheme("pink_panic", { "scysta/pink-panic.nvim" }),

  -- A dark and light Neovim theme written in fennel, inspired by IBM Carbon.
  scheme("oxocarbon", { "nyoom-engineering/oxocarbon.nvim" }),

  -- NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.
  scheme("kanagawa", { "rebelot/kanagawa.nvim" }),

  -- Low-contrast calm color scheme for Vim
  scheme("spring_night", { "rhysd/vim-color-spring-night" }),

  -- A 24bit colorscheme for Vim, Airline and Lightline
  scheme("tender", { "jacoborus/tender.vim" }),

  -- 🗡️ Warm colorscheme for Neovim and beyond
  scheme("melange", { "savq/melange" }),

  -- 🪨 A collection of contrast-based Vim/Neovim colorschemes
  scheme("zenbones", { "mcchrish/zenbones.nvim" }),

  -- 🦊 A highly customizable theme for vim and neovim with support for lsp, treesitter and a variety of plugins.
  scheme("nightfox", { "EdenEast/nightfox.nvim" }),

  -- 🌑 Neovim theme inspired by material palenight.
  scheme("palenightfall", { "JoosepAlviste/palenightfall.nvim" }),

  --- 🍨 Soothing pastel theme for (Neo)vim
  scheme("catppuccini", { "catppuccin/nvim", name = "catppuccin" }),

  --- 🌌  Aylin a modern and minimal VIM dark theme with bright colors.
  scheme("aylin", { "AhmedAbdulrahman/aylin.vim" }),
}
