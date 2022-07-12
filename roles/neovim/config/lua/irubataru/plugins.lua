local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

local configs = {
  alpha = function () require("irubataru.plugins.alpha") end,
  clang_format = function() require('irubataru.plugins.clang-format') end,
  cmp = function() require('irubataru.plugins.cmp') end,
  commenter = function() require('irubataru.plugins.commenter') end,
  cokeline = function() require('irubataru.plugins.cokeline') end,
  copilot = function() require('irubataru.plugins.copilot') end,
  cpp_enhanced_highlight = function() require('irubataru.plugins.cpp_enhanced_highlight') end,
  dap_install = function() require('irubataru.plugins.dap-install') end,
  fugitive = function() require('irubataru.plugins.fugitive') end,
  gitsigns = function() require('irubataru.plugins.gitsigns') end,
  goto_preview = function() require('irubataru.plugins.goto-preview') end,
  goyo = function() require('irubataru.plugins.goyo') end,
  illuminate = function() require('irubataru.plugins.illuminate') end,
  incsearch = function() require('irubataru.plugins.incsearch') end,
  indentline = function() require('irubataru.plugins.indentline') end,
  localvimrc = function() require('irubataru.plugins.localvimrc') end,
  lualine = function() require('irubataru.plugins.lualine') end,
  luasnip = function() require('irubataru.plugins.luasnip') end,
  mkdx = function() require('irubataru.plugins.mkdx') end,
  nvim_tree = function() require('irubataru.plugins.nvim_tree') end,
  operator_flashy = function() require('irubataru.plugins.operator-flashy') end,
  project = function() require('irubataru.plugins.project') end,
  quickscope = function() require('irubataru.plugins.quickscope') end,
  telescope = function() require('irubataru.plugins.telescope') end,
  template = function() require('irubataru.plugins.template') end,
  toggleterm = function() require('irubataru.plugins.toggleterm') end,
  treesitter = function() require('irubataru.plugins.treesitter') end,
  trouble = function() require('irubataru.plugins.trouble') end,
  vimtex = function() require('irubataru.plugins.vimtex') end,
  which_key = function() require('irubataru.plugins.which-key') end,
}

return packer.startup(function(use)

  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'lewis6991/impatient.nvim'

  -- Keymaps
  use({
    "folke/which-key.nvim",
    config = configs.which_key,
  })

  -- Colour schemes
  use 'junegunn/seoul256.vim'

  -- UI and look
  use {
    'noib3/cokeline.nvim',  -- 👃 A neovim bufferline for people with addictive personalities
    config = configs.cokeline,
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    "nvim-lualine/lualine.nvim", -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
    config = configs.lualine,
    requires = "arkav/lualine-lsp-progress"
  }

  use {
    'haya14busa/vim-operator-flashy', -- Highlight yanked area
    config = configs.operator_flashy,
    requires = 'kana/vim-operator-user'
  }
  use { 'Yggdroot/indentLine', config = configs.indentline, ft = { 'python' }} -- A vim plugin to display the indention levels with thin vertical lines
  use { 'haya14busa/incsearch.vim', config = configs.incsearch } -- Improved incremental searching for Vim
  use { 'junegunn/limelight.vim' } -- Hyperfocus-writing in Vim
  use { 'junegunn/goyo.vim', config = configs.goyo } -- Distraction-free writing in Vim
  use { "goolord/alpha-nvim", config = configs.alpha }
  use { "lewis6991/gitsigns.nvim", config = configs.gitsigns } -- Git integration for buffers

  use {
    "luukvbaal/stabilize.nvim", -- Neovim plugin to stabilize window open/close events.
    config = function() require("stabilize").setup() end
  }


  -- Autocomplete
  use { 'hrsh7th/nvim-cmp', config = configs.cmp } -- A completion plugin for neovim coded in Lua.tr
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim builtin LSP client
  use 'hrsh7th/cmp-nvim-lua' -- nvim-cmp source for nvim lua
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path' -- nvim-cmp source for path
  use 'hrsh7th/cmp-cmdline' -- nvim-cmp source for vim's cmdline
  use 'saadparwaiz1/cmp_luasnip' -- luasnip completion source for nvim-cmp
  use { 'tzachar/cmp-tabnine', run = './install.sh' } -- TabNine plugin for hrsh7th/nvim-cmp
  use {
    'petertriho/cmp-git', -- Git source for nvim-cmp
    requires = "nvim-lua/plenary.nvim",
    config = function () require("cmp_git").setup() end
  }
  use 'onsails/lspkind-nvim' -- vscode-like pictograms for neovim lsp completion items

  if require("irubataru.plugins.copilot").options.use then
    use 'hrsh7th/cmp-copilot' -- copilot.vim source for nvim-cmp
    use { 'github/copilot.vim', config = configs.copilot } -- Neovim plugin for GitHub Copilot
  end

  -- LSP
  use { 'neovim/nvim-lspconfig' } -- Quickstart configurations for the Nvim LSP client
  use 'williamboman/nvim-lsp-installer' -- Companion plugin for nvim-lspconfig that allows you to seamlessly manage LSP servers locally with :LspInstall. With full Windows support!
  use { "jose-elias-alvarez/null-ls.nvim" } -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua. 

  use {
    "RRethy/vim-illuminate", -- Vim plugin for automatically highlighting other uses of the word under the cursor. Integrates with Neovim's LSP client for intelligent highlighting.
    event = "CursorHold",
    module = "illuminate",
    config = configs.illuminate
  }

  use {
    "folke/trouble.nvim", -- 🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
    requires = "kyazdani42/nvim-web-devicons",
    config = configs.trouble
  }

  use {
    "rmagatti/goto-preview", -- A small Neovim plugin for previewing definitions using floating windows.
    config = configs.goto_preview
  }

  -- Snippets
  use {
    'L3MON4D3/LuaSnip', -- Snippet Engine for Neovim written in Lua.
    requires = "rafamadriz/friendly-snippets",
    config = configs.luasnip
  }

  -- Tree sitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = configs.treesitter}

  -- Fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    config = configs.telescope,
    requires = 'nvim-lua/plenary.nvim',
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  -- Other plugins
  use 'tpope/vim-repeat' -- Enable repeating supported plugin maps with .
  use 'tpope/vim-surround' -- quoting/parenthesizing made simple
  use 'tpope/vim-unimpaired' -- Pairs of handy bracket mappings
  use 'tpope/vim-dispatch' -- Asynchronous build and test dispatcher
  use 'wikitopian/hardmode' -- Disable arrow movement, update to takac/vim-hardtime eventually
  use 'nvim-lua/plenary.nvim' -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
  use {
    'numToStr/Comment.nvim', -- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports commentstring, dot repeat, left-right/up-down motions, hooks, and more
    config = configs.commenter
  }
  use { 'aperezdc/vim-template', config = configs.template, cmd = { 'Template' } } -- Simple templates plugin for Vim
  use { 'embear/vim-localvimrc', config = configs.localvimrc } -- Search local vimrc files ('.lvimrc') in the tree (root dir up to current dir) and load them.
  use { 'junegunn/vim-easy-align' } -- A Vim alignment plugin
  use { 'unblevable/quick-scope', config = configs.quickscope } -- Highlighting for f,F,t,T
  use { "akinsho/toggleterm.nvim", config = configs.toggleterm } -- A neovim lua plugin to help easily manage multiple terminal windows
  use { 'AndrewRadev/linediff.vim' } -- A vim plugin to perform diffs on blocks of code
  use { 'skywind3000/asyncrun.vim' } -- Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window
  use {
    'kyazdani42/nvim-tree.lua', -- A file explorer tree for neovim written in lua
    requires = 'kyazdani42/nvim-web-devicons',
    config = configs.nvim_tree
  }
  use { "windwp/nvim-autopairs", config = function() require('nvim-autopairs').setup{} end, } -- autopairs for neovim written by lua
  use {
    "inkarkat/vim-ReplaceWithRegister", -- Replace text with the contents of a register.
    setup = function() require("irubataru.plugins.replace-with-register").setup() end
  }
  use { "ahmedkhalf/project.nvim", config = configs.project } -- The superior project management solution for neovim.

  -- DAP
  -- use { "mfussenegger/nvim-dap" }
  -- use { "theHamsta/nvim-dap-virtual-text" }
  -- use { "rcarriga/nvim-dap-ui" }

  -- Git
  use { 'tpope/vim-fugitive', config = configs.fugitive } -- The best git plugin
  use 'rhysd/git-messenger.vim' -- Vim and Neovim plugin to reveal the commit messages under the cursor
  use { -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }

  -- Language specific plugins
  -- {{{

  -- C/C++
  use { 'octol/vim-cpp-enhanced-highlight', config = configs.cpp_enhanced_highlight, ft = { 'cpp' } } -- Additional Vim syntax highlighting for C++ (including C++11/14/17)
  use { 'preservim/tagbar', ft = { 'cpp' } } -- Vim plugin that displays tags in a window, ordered by scope
  use {
    'rhysd/vim-clang-format', -- Vim plugin for clang-format
    config = configs.clang_format,
    ft = { 'hpp', 'cpp', 'c' },
    requires = 'kana/vim-operator-user'
  }

  -- Python
  use {
    'Chiel92/vim-autoformat', -- Provide easy code formatting in Vim by integrating existing code formatters
    ft = { 'python', 'tex', 'html', 'css', 'javascript' }
  }
  use {'tmhedberg/SimpylFold',ft =  { 'python' } } -- No-BS Python code folding for Vim

  -- Clojure
  use { 'Olical/conjure', ft = { 'clojure' } } -- Interactive evaluation for Neovim (Clojure, Fennel, Janet, Racket, Hy, MIT Scheme, Guile)

  use {
    'tpope/vim-sexp-mappings-for-regular-people', -- vim-sexp mappings for regular people
    ft = { 'clojure' },
    requires = { 'guns/vim-sexp', ft = { 'clojure' } } -- Precision Editing for S-expressions
  }

  -- use { 'tpope/vim-fireplace', ft = { 'clojure' } } -- Clojure REPL support
  -- use { 'guns/vim-clojure-static', ft = { 'clojure' } } -- Meikel Brandmeyer's excellent Clojure runtime files
  -- use { 'guns/vim-clojure-highlight', ft = { 'clojure' } } -- Extend builtin syntax highlighting to referred and aliased vars in Clojure buffers
  -- use { 'vim-scripts/paredit.vim', ft = { 'clojure' } } -- Paredit Mode: Structured Editing of Lisp S-expressions
  -- use { 'venantius/vim-cljfmt', ft = { 'clojure' } } -- A Vim plugin for cljfmt, the Clojure formatting tool.

  -- LaTeX
  use { 'lervag/vimtex', config = configs.vimtex, ft = { 'tex' } } -- A modern Vim and neovim filetype plugin for LaTeX files.
  use { 'KeitaNakamura/tex-conceal.vim', ft = { 'tex' } } -- This plugin extends the Conceal feature of Vim for LaTeX.

  -- JavaScript / JSON
  use { 'pangloss/vim-javascript', ft = { 'javascript' } } -- Vastly improved Javascript indentation and syntax support in Vim.
  use { 'Olical/vim-syntax-expand', ft = { 'javascript' } } -- Expand characters to code if not in a comment or string
  use { 'elzr/vim-json', ft = { 'json' } } -- A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
  use { "b0o/schemastore.nvim" } -- A Neovim Lua plugin providing access to the SchemaStore catalog.

  -- Markdown
  use { 'SidOfc/mkdx', ft = { 'markdown' } } -- A vim plugin that adds some nice extra's for working with markdown documents
  use({ "npxbr/glow.nvim", cmd = "Glow" }) -- A markdown preview directly in your neovim.

  -- Other syntax highlighting
  use 'lazywei/vim-matlab' -- A matlab plugin for vim, includes syntax highlighting, correct indention and so on.
  use 'rsmenon/vim-mathematica' -- Mathematica syntax highlighting (and more) for vim
  use 'vim-scripts/gnuplot.vim' -- Syntax highlighting for Gnuplot
  use 'Glench/Vim-Jinja2-Syntax' -- An up-to-date jinja2 syntax file.
  use 'jalvesaq/Nvim-R' -- Vim plugin to work with R
  use {'tmux-plugins/vim-tmux', ft = { 'tmux' } } -- vim plugin for tmux.conf

  -- }}}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
