vim.cmd [[packadd packer.nvim]]

local configs = {
  clang_format = function() require('plugins/clang-format') end,
  cmp = function() require('plugins/cmp') end,
  commenter = function() require('plugins/commenter') end,
  cokeline = function() require('plugins/cokeline') end,
  cpp_enhanced_highlight = function() require('plugins/cpp_enhanced_highlight') end,
  easyalign = function() require('plugins/easyalign') end,
  fugitive = function() require('plugins/fugitive') end,
  goyo = function() require('plugins/goyo') end,
  incsearch = function() require('plugins/incsearch') end,
  indentline = function() require('plugins/indentline') end,
  lightline = function() require('plugins/lightline') end,
  limelight = function() require('plugins/limelight') end,
  linediff = function() require('plugins/linediff') end,
  localvimrc = function() require('plugins/localvimrc') end,
  lspconfig = function() require('plugins/lsp') end,
  luasnip = function() require('plugins/luasnip') end,
  mkdx = function() require('plugins/mkdx') end,
  nvim_tree = function() require('plugins/nvim_tree') end,
  operator_flashy = function() require('plugins/operator-flashy') end,
  quickscope = function() require('plugins/quickscope') end,
  signify = function() require('plugins/signify') end,
  startify = function() require('plugins/startify') end,
  telescope = function() require('plugins/telescope') end,
  template = function() require('plugins/template') end,
  terminal_help = function() require('plugins/terminal-help') end,
  treesitter = function() require('plugins/treesitter') end,
  trouble = function() require('plugins/trouble') end,
  vimtex = function() require('plugins/vimtex') end,
  vimwiki = function() require('plugins/vimwiki') end,
}

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'

  -- General plugins
  use 'tpope/vim-repeat' -- Enable repeating supported plugin maps with .
  use 'tpope/vim-surround' -- quoting/parenthesizing made simple
  use 'tpope/vim-unimpaired' -- Pairs of handy bracket mappings
  use 'tpope/vim-dispatch' -- Asynchronous build and test dispatcher
  use 'wikitopian/hardmode' -- Disable arrow movement, update to takac/vim-hardtime eventually

  -- Colour schemes
  use 'junegunn/seoul256.vim'
  use 'Irubataru/vim-colors-solarized'
  use 'NLKNguyen/papercolor-theme'
  use 'chriskempson/base16-vim'
  use 'trevordmiller/nova-vim'
  use 'dracula/vim'

  -- UI and look
  use {
    'noib3/cokeline.nvim',  -- 👃 A neovim bufferline for people with addictive personalities
    config = configs.cokeline,
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use { 'itchyny/lightline.vim', config = configs.lightline } -- A light and configurable statusline/tabline plugin for Vim
  use {
    'haya14busa/vim-operator-flashy', -- Highlight yanked area
    config = configs.operator_flashy,
    requires = 'kana/vim-operator-user'
  }
  use { 'Yggdroot/indentLine', config = configs.indentline, ft = { 'python' }} -- A vim plugin to display the indention levels with thin vertical lines
  use { 'haya14busa/incsearch.vim', config = configs.incsearch } -- Improved incremental searching for Vim
  use { 'junegunn/limelight.vim', config = configs.limelight } -- Hyperfocus-writing in Vim
  use { 'junegunn/goyo.vim', config = configs.goyo } -- Distraction-free writing in Vim
  use { 'mhinz/vim-startify', config = configs.startify } -- The fancy start screen for Vim
  use { 'mhinz/vim-signify', config = configs.signify } -- Show a diff using Vim its sign column
  use 'tversteeg/registers.nvim' -- NeoVim plugin to preview the contents of the registers

  -- LSP
  use 'wbthomason/lsp-status.nvim' -- Utility functions for getting diagnostic status and progress messages from LSP servers, for use in the Neovim statusline
  use { 'neovim/nvim-lspconfig', config = configs.lspconfig } -- Quickstart configurations for the Nvim LSP client
  use 'williamboman/nvim-lsp-installer' -- Companion plugin for nvim-lspconfig that allows you to seamlessly manage LSP servers locally with :LspInstall. With full Windows support!
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim builtin LSP client
  use 'hrsh7th/cmp-nvim-lua' -- nvim-cmp source for nvim lua
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path' -- nvim-cmp source for path
  use 'hrsh7th/cmp-cmdline' -- nvim-cmp source for vim's cmdline
  use { 'tzachar/cmp-tabnine', run = './install.sh' } -- TabNine plugin for hrsh7th/nvim-cmp
  use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"}) -- Git source for nvim-cmp
  use 'onsails/lspkind-nvim' -- vscode-like pictograms for neovim lsp completion items
  use { 'hrsh7th/nvim-cmp', config = configs.cmp } -- A completion plugin for neovim coded in Lua.tr
  use { 'L3MON4D3/LuaSnip', config = configs.luasnip } -- Snippet Engine for Neovim written in Lua.

  use {
    "folke/trouble.nvim", -- 🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
    requires = "kyazdani42/nvim-web-devicons",
    config = configs.trouble
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

  -- Additional functionality
  --use 'preservim/nerdcommenter' -- Vim plugin for intensely nerdy commenting powers
  use {
    'numToStr/Comment.nvim', -- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports commentstring, dot repeat, left-right/up-down motions, hooks, and more
    config = configs.commenter
  }
  use 'xolox/vim-misc' -- A dependency but can't remember of what
  use { 'aperezdc/vim-template', config = configs.template, cmd = { 'Template' } } -- Simple templates plugin for Vim
  use { 'embear/vim-localvimrc', config = configs.localvimrc } -- Search local vimrc files ('.lvimrc') in the tree (root dir up to current dir) and load them.
  use { 'junegunn/vim-easy-align', config = configs.easyalign } -- A Vim alignment plugin
  use { 'unblevable/quick-scope', config = configs.quickscope } -- Highlighting for f,F,t,T
  use { 'skywind3000/vim-terminal-help', config = configs.terminal_help } -- Small changes make vim/nvim's internal terminal great again
  use { 'AndrewRadev/linediff.vim', config = configs.linediff } -- A vim plugin to perform diffs on blocks of code
  use 'skywind3000/asyncrun.vim' -- Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window
  use {
    'kyazdani42/nvim-tree.lua', -- A file explorer tree for neovim written in lua
    requires = 'kyazdani42/nvim-web-devicons',
    config = configs.nvim_tree
  }

  -- Note taking
  use {'vimwiki/vimwiki', config = configs.vimwiki, branch = 'dev'} -- Pesonalized wiki and note taking

  -- Git
  use { 'tpope/vim-fugitive', config = configs.fugitive } -- The best git plugin
  use 'airblade/vim-rooter' -- Changes the vim directory to project root
  use 'rhysd/git-messenger.vim' -- Vim and Neovim plugin to reveal the commit messages under the cursor
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' } -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.

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

  -- For Clojure
  use { 'tpope/vim-fireplace', ft = { 'clojure' } } -- Clojure REPL support
  use { 'guns/vim-clojure-static', ft = { 'clojure' } } -- Meikel Brandmeyer's excellent Clojure runtime files
  use { 'guns/vim-clojure-highlight', ft = { 'clojure' } } -- Extend builtin syntax highlighting to referred and aliased vars in Clojure buffers
  use { 'vim-scripts/paredit.vim', ft = { 'clojure' } } -- Paredit Mode: Structured Editing of Lisp S-expressions
  use { 'venantius/vim-cljfmt', ft = { 'clojure' } } -- A Vim plugin for cljfmt, the Clojure formatting tool.

  -- For LaTeX
  use { 'lervag/vimtex', config = configs.vimtex, ft = { 'tex' } } -- A modern Vim and neovim filetype plugin for LaTeX files.
  use { 'KeitaNakamura/tex-conceal.vim', ft = { 'tex' } } -- This plugin extends the Conceal feature of Vim for LaTeX.

  -- For JavaScript
  use { 'pangloss/vim-javascript', ft = { 'javascript' } } -- Vastly improved Javascript indentation and syntax support in Vim.
  use { 'Olical/vim-syntax-expand', ft = { 'javascript' } } -- Expand characters to code if not in a comment or string
  use { 'elzr/vim-json', ft = { 'json' } } -- A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.

  -- For Markdown
  use { 'SidOfc/mkdx', ft = { 'markdown' } } -- A vim plugin that adds some nice extra's for working with markdown documents

  -- Other syntax highlighting
  use 'lazywei/vim-matlab' -- A matlab plugin for vim, includes syntax highlighting, correct indention and so on.
  use 'rsmenon/vim-mathematica' -- Mathematica syntax highlighting (and more) for vim
  use 'vim-scripts/gnuplot.vim' -- Syntax highlighting for Gnuplot
  use 'Glench/Vim-Jinja2-Syntax' -- An up-to-date jinja2 syntax file.
  use 'jalvesaq/Nvim-R' -- Vim plugin to work with R

end)
