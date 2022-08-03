local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("lewis6991/impatient.nvim")
  use("nvim-lua/plenary.nvim") -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
  use("antoinemadec/FixCursorHold.nvim")

  -- Keymaps
  use({
    "folke/which-key.nvim",
    config = function()
      require("irubataru.plugins.which-key")
    end,
  })

  -- Colour schemes
  use("junegunn/seoul256.vim")

  -- UI and look
  use({
    "noib3/cokeline.nvim", -- 👃 A neovim bufferline for people with addictive personalities
    config = function()
      require("irubataru.plugins.cokeline")
    end,
    requires = "kyazdani42/nvim-web-devicons",
  })

  use({
    "nvim-lualine/lualine.nvim", -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
    config = function()
      require("irubataru.plugins.lualine")
    end,
    requires = "arkav/lualine-lsp-progress",
  })

  use({
    "haya14busa/vim-operator-flashy", -- Highlight yanked area
    config = function()
      require("irubataru.plugins.operator-flashy")
    end,
    requires = "kana/vim-operator-user",
  })

  use({
    "Yggdroot/indentLine", -- A vim plugin to display the indention levels with thin vertical lines
    config = function()
      require("irubataru.plugins.indentline")
    end,
    ft = { "python" },
  })
  use({
    "haya14busa/incsearch.vim", -- Improved incremental searching for Vim
    config = function()
      require("irubataru.plugins.incsearch")
    end,
  })
  use({ "junegunn/limelight.vim" }) -- Hyperfocus-writing in Vim
  use({
    "junegunn/goyo.vim", -- Distraction-free writing in Vim
    config = function()
      require("irubataru.plugins.goyo")
    end,
  })
  use({
    "goolord/alpha-nvim",
    config = function()
      require("irubataru.plugins.alpha")
    end,
  })
  use({
    "lewis6991/gitsigns.nvim", -- Git integration for buffers
    config = function()
      require("irubataru.plugins.gitsigns")
    end,
  })

  use({
    "luukvbaal/stabilize.nvim", -- Neovim plugin to stabilize window open/close events.
    config = function()
      require("stabilize").setup()
    end,
  })

  use({
    "sindrets/winshift.nvim", -- Rearrange your windows with ease.
    config = function()
      require("winshift").setup()
    end,
  })

  -- use({
  --   "beauwilliams/focus.nvim",
  --   config = function()
  --     require("irubataru.plugins.focus")
  --   end,
  -- })

  -- Autocomplete
  use({
    "hrsh7th/nvim-cmp", -- A completion plugin for neovim coded in Lua.tr
    config = function()
      require("irubataru.plugins.cmp")
    end,
    requires = {
      "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
      "hrsh7th/cmp-nvim-lua", -- nvim-cmp source for nvim lua
      "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
      "hrsh7th/cmp-path", -- nvim-cmp source for path
      "hrsh7th/cmp-cmdline", -- nvim-cmp source for vim's cmdline
      "saadparwaiz1/cmp_luasnip", -- luasnip completion source for nvim-cmp
      { "tzachar/cmp-tabnine", run = "./install.sh" }, -- TabNine plugin for hrsh7th/nvim-cmp
      {
        "petertriho/cmp-git", -- Git source for nvim-cmp
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("cmp_git").setup()
        end,
      },
    },
  })
  use("onsails/lspkind-nvim") -- vscode-like pictograms for neovim lsp completion items

  if require("irubataru.plugins.copilot").options.use then
    use("hrsh7th/cmp-copilot") -- copilot.vim source for nvim-cmp
    use({
      "github/copilot.vim", -- Neovim plugin for GitHub Copilot
      config = function()
      require("irubataru.plugins.copilot")
    end,
    })
  end

  -- LSP
  use({ "neovim/nvim-lspconfig" }) -- Quickstart configurations for the Nvim LSP client
  use("williamboman/nvim-lsp-installer") -- Companion plugin for nvim-lspconfig that allows you to seamlessly manage LSP servers locally with :LspInstall. With full Windows support!
  use({ "jose-elias-alvarez/null-ls.nvim" }) -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  use({ "SmiteshP/nvim-navic" }) -- Simple winbar/statusline plugin that shows your current code context

  use({
    "RRethy/vim-illuminate", -- Vim plugin for automatically highlighting other uses of the word under the cursor. Integrates with Neovim's LSP client for intelligent highlighting.
    event = "CursorHold",
    module = "illuminate",
    config = function()
      require("irubataru.plugins.illuminate")
    end,
  })

  use({
    "folke/trouble.nvim", -- 🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("irubataru.plugins.trouble")
    end,
  })

  use({
    "rmagatti/goto-preview", -- A small Neovim plugin for previewing definitions using floating windows.
    config = function()
      require("irubataru.plugins.goto-preview")
    end,
  })

  use({
    "ray-x/lsp_signature.nvim", -- LSP signature hint as you type
  })

  -- Snippets
  use({
    "L3MON4D3/LuaSnip", -- Snippet Engine for Neovim written in Lua.
    requires = "rafamadriz/friendly-snippets",
    config = function()
      require("irubataru.plugins.luasnip")
    end,
  })

  -- Tree sitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("irubataru.plugins.treesitter")
    end,
  })

  -- Fuzzy finding
  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("irubataru.plugins.telescope")
    end,
    requires = "nvim-lua/plenary.nvim",
  })
  use("nvim-telescope/telescope-ui-select.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- Unit testing
  use({
    "nvim-neotest/neotest", -- An extensible framework for interacting with tests within NeoVim.
    requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim" },
    config = function()
      require("irubataru.plugins.neotest")
    end,
  })
  use("nvim-neotest/neotest-python")
  use({ "nvim-neotest/neotest-vim-test", requires = "vim-test/vim-test" })

  -- DAP
  -- use { "mfussenegger/nvim-dap" }
  -- use { "theHamsta/nvim-dap-virtual-text" }
  -- use { "rcarriga/nvim-dap-ui" }

  -- Other plugins
  use("tpope/vim-repeat") -- Enable repeating supported plugin maps with .
  use("tpope/vim-surround") -- quoting/parenthesizing made simple
  use("tpope/vim-unimpaired") -- Pairs of handy bracket mappings
  use("tpope/vim-dispatch") -- Asynchronous build and test dispatcher
  use("wikitopian/hardmode") -- Disable arrow movement, update to takac/vim-hardtime eventually
  use({
    "numToStr/Comment.nvim", -- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports commentstring, dot repeat, left-right/up-down motions, hooks, and more
    config = function()
      require("irubataru.plugins.commenter")
    end,
  })
  use({
    "embear/vim-localvimrc", -- Search local vimrc files ('.lvimrc') in the tree (root dir up to current dir) and load them.
    config = function()
      require("irubataru.plugins.localvimrc")
    end,
  })
  use({ "junegunn/vim-easy-align" }) -- A Vim alignment plugin
  use({
    "unblevable/quick-scope", -- Highlighting for f,F,t,T
    config = function()
      require("irubataru.plugins.quickscope")
    end,
  })
  use({
    "akinsho/toggleterm.nvim", -- A neovim lua plugin to help easily manage multiple terminal windows
    config = function()
      require("irubataru.plugins.toggleterm")
    end,
  })
  use({ "AndrewRadev/linediff.vim" }) -- A vim plugin to perform diffs on blocks of code
  use({ "skywind3000/asyncrun.vim" }) -- Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window
  use({
    "kyazdani42/nvim-tree.lua", -- A file explorer tree for neovim written in lua
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("irubataru.plugins.nvim_tree")
    end,
  })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  }) -- autopairs for neovim written by lua
  use({
    "inkarkat/vim-ReplaceWithRegister", -- Replace text with the contents of a register.
    setup = function()
      require("irubataru.plugins.replace-with-register").setup()
    end,
  })
  use({
    "ahmedkhalf/project.nvim", -- The superior project management solution for neovim.
    config = function()
      require("irubataru.plugins.project")
    end,
  })
  use({
    "rafcamlet/nvim-luapad",
    requires = "antoinemadec/FixCursorHold.nvim",
    cmd = { "Luapad", "LuaRun" },
  })
  -- use { "glepnir/template.nvim", config = configs.template } -- Quickly insert templates into file

  -- Git
  use({
    "tpope/vim-fugitive", -- The best git plugin
    config = function()
      require("irubataru.plugins.fugitive")
    end,
  })
  use("rhysd/git-messenger.vim") -- Vim and Neovim plugin to reveal the commit messages under the cursor
  use({ -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("irubataru.plugins.diffview")
    end,
  })

  -- Language specific plugins
  -- {{{

  -- C/C++
  use({
    "octol/vim-cpp-enhanced-highlight", -- Additional Vim syntax highlighting for C++ (including C++11/14/17)
    config = function()
      require("irubataru.plugins.cpp_enhanced_highlight")
    end,
    ft = { "cpp" }
  })
  use({ "preservim/tagbar", ft = { "cpp" } }) -- Vim plugin that displays tags in a window, ordered by scope
  use({
    "rhysd/vim-clang-format", -- Vim plugin for clang-format
    config = function()
      require("irubataru.plugins.clang-format")
    end,
    ft = { "hpp", "cpp", "c" },
    requires = "kana/vim-operator-user",
  })

  -- Python
  use({
    "Chiel92/vim-autoformat", -- Provide easy code formatting in Vim by integrating existing code formatters
    ft = { "python", "tex", "html", "css", "javascript" },
  })
  use({ "tmhedberg/SimpylFold", ft = { "python" } }) -- No-BS Python code folding for Vim

  -- Clojure
  use({ "Olical/conjure", ft = { "clojure" } }) -- Interactive evaluation for Neovim (Clojure, Fennel, Janet, Racket, Hy, MIT Scheme, Guile)

  use({
    "tpope/vim-sexp-mappings-for-regular-people", -- vim-sexp mappings for regular people
    ft = { "clojure" },
    requires = { "guns/vim-sexp", ft = { "clojure" } }, -- Precision Editing for S-expressions
  })

  -- use { 'tpope/vim-fireplace', ft = { 'clojure' } } -- Clojure REPL support
  -- use { 'guns/vim-clojure-static', ft = { 'clojure' } } -- Meikel Brandmeyer's excellent Clojure runtime files
  -- use { 'guns/vim-clojure-highlight', ft = { 'clojure' } } -- Extend builtin syntax highlighting to referred and aliased vars in Clojure buffers
  -- use { 'vim-scripts/paredit.vim', ft = { 'clojure' } } -- Paredit Mode: Structured Editing of Lisp S-expressions
  -- use { 'venantius/vim-cljfmt', ft = { 'clojure' } } -- A Vim plugin for cljfmt, the Clojure formatting tool.

  -- LaTeX
  use({
    "lervag/vimtex", -- A modern Vim and neovim filetype plugin for LaTeX files.
    ft = { "tex" },
    config = function()
      require("irubataru.plugins.vimtex")
    end,
  })
  use({ "KeitaNakamura/tex-conceal.vim", ft = { "tex" } }) -- This plugin extends the Conceal feature of Vim for LaTeX.

  -- JavaScript / JSON
  use({ "pangloss/vim-javascript", ft = { "javascript" } }) -- Vastly improved Javascript indentation and syntax support in Vim.
  use({ "Olical/vim-syntax-expand", ft = { "javascript" } }) -- Expand characters to code if not in a comment or string
  use({ "elzr/vim-json", ft = { "json" } }) -- A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
  use({ "b0o/schemastore.nvim" }) -- A Neovim Lua plugin providing access to the SchemaStore catalog.

  -- Markdown
  use({ "SidOfc/mkdx", ft = { "markdown" } }) -- A vim plugin that adds some nice extra's for working with markdown documents
  use({ "npxbr/glow.nvim", cmd = "Glow" }) -- A markdown preview directly in your neovim.

  -- Other syntax highlighting
  use("lazywei/vim-matlab") -- A matlab plugin for vim, includes syntax highlighting, correct indention and so on.
  use("rsmenon/vim-mathematica") -- Mathematica syntax highlighting (and more) for vim
  use("vim-scripts/gnuplot.vim") -- Syntax highlighting for Gnuplot
  use("Glench/Vim-Jinja2-Syntax") -- An up-to-date jinja2 syntax file.
  use("jalvesaq/Nvim-R") -- Vim plugin to work with R
  use({ "tmux-plugins/vim-tmux", ft = { "tmux" } }) -- vim plugin for tmux.conf

  -- }}}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
