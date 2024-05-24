# Neovim

<a href="https://dotfyle.com/Irubataru/dotfiles-roles-neovim-config"><img src="https://dotfyle.com/Irubataru/dotfiles-roles-neovim-config/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/Irubataru/dotfiles-roles-neovim-config"><img src="https://dotfyle.com/Irubataru/dotfiles-roles-neovim-config/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/Irubataru/dotfiles-roles-neovim-config"><img src="https://dotfyle.com/Irubataru/dotfiles-roles-neovim-config/badges/plugin-manager?style=flat" /></a>


## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:Irubataru/dotfiles ~/.config/Irubataru/dotfiles
NVIM_APPNAME=Irubataru/dotfiles/roles/neovim/config nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=Irubataru/dotfiles/roles/neovim/config nvim
```

## Plugins

### bars-and-lines

+ [utilyre/barbecue.nvim](https://dotfyle.com/plugins/utilyre/barbecue.nvim)
+ [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)
### code-runner

+ [stevearc/overseer.nvim](https://dotfyle.com/plugins/stevearc/overseer.nvim)
### color

+ [mvllow/modes.nvim](https://dotfyle.com/plugins/mvllow/modes.nvim)
### colorscheme

+ [rebelot/kanagawa.nvim](https://dotfyle.com/plugins/rebelot/kanagawa.nvim)
+ [pauchiner/pastelnight.nvim](https://dotfyle.com/plugins/pauchiner/pastelnight.nvim)
+ [nyoom-engineering/oxocarbon.nvim](https://dotfyle.com/plugins/nyoom-engineering/oxocarbon.nvim)
+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
+ [mcchrish/zenbones.nvim](https://dotfyle.com/plugins/mcchrish/zenbones.nvim)
+ [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
+ [EdenEast/nightfox.nvim](https://dotfyle.com/plugins/EdenEast/nightfox.nvim)
### colorscheme-creation

+ [rktjmp/lush.nvim](https://dotfyle.com/plugins/rktjmp/lush.nvim)
### comment

+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
+ [simrat39/rust-tools.nvim](https://dotfyle.com/plugins/simrat39/rust-tools.nvim)
### cursorline

+ [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)
### debugging

+ [theHamsta/nvim-dap-virtual-text](https://dotfyle.com/plugins/theHamsta/nvim-dap-virtual-text)
+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
+ [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
### dependency-management

+ [Saecki/crates.nvim](https://dotfyle.com/plugins/Saecki/crates.nvim)
### diagnostics

+ [folke/lsp-colors.nvim](https://dotfyle.com/plugins/folke/lsp-colors.nvim)
+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
### editing-support

+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
+ [Wansmer/treesj](https://dotfyle.com/plugins/Wansmer/treesj)
### fennel

+ [Olical/conjure](https://dotfyle.com/plugins/Olical/conjure)
### file-explorer

+ [simonmclean/triptych.nvim](https://dotfyle.com/plugins/simonmclean/triptych.nvim)
+ [kyazdani42/nvim-tree.lua](https://dotfyle.com/plugins/kyazdani42/nvim-tree.lua)
### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
+ [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)
### icon

+ [ziontee113/icon-picker.nvim](https://dotfyle.com/plugins/ziontee113/icon-picker.nvim)
+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
### keybinding

+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
+ [mrjones2014/legendary.nvim](https://dotfyle.com/plugins/mrjones2014/legendary.nvim)
### lsp

+ [nvimtools/none-ls.nvim](https://dotfyle.com/plugins/nvimtools/none-ls.nvim)
+ [stevearc/aerial.nvim](https://dotfyle.com/plugins/stevearc/aerial.nvim)
+ [j-hui/fidget.nvim](https://dotfyle.com/plugins/j-hui/fidget.nvim)
+ [rmagatti/goto-preview](https://dotfyle.com/plugins/rmagatti/goto-preview)
+ [simrat39/symbols-outline.nvim](https://dotfyle.com/plugins/simrat39/symbols-outline.nvim)
+ [roobert/action-hints.nvim](https://dotfyle.com/plugins/roobert/action-hints.nvim)
+ [ray-x/lsp_signature.nvim](https://dotfyle.com/plugins/ray-x/lsp_signature.nvim)
+ [zeioth/garbage-day.nvim](https://dotfyle.com/plugins/zeioth/garbage-day.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### markdown-and-latex

+ [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)
### marks

+ [fnune/recall.nvim](https://dotfyle.com/plugins/fnune/recall.nvim)
### note-taking

+ [epwalsh/obsidian.nvim](https://dotfyle.com/plugins/epwalsh/obsidian.nvim)
### nvim-dev

+ [rafcamlet/nvim-luapad](https://dotfyle.com/plugins/rafcamlet/nvim-luapad)
+ [kkharji/sqlite.lua](https://dotfyle.com/plugins/kkharji/sqlite.lua)
+ [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### programming-languages-support

+ [dmmulroy/ts-error-translator.nvim](https://dotfyle.com/plugins/dmmulroy/ts-error-translator.nvim)
+ [gennaro-tedesco/nvim-jqx](https://dotfyle.com/plugins/gennaro-tedesco/nvim-jqx)
### project

+ [ahmedkhalf/project.nvim](https://dotfyle.com/plugins/ahmedkhalf/project.nvim)
### snippet

+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### split-and-window

+ [sindrets/winshift.nvim](https://dotfyle.com/plugins/sindrets/winshift.nvim)
+ [beauwilliams/focus.nvim](https://dotfyle.com/plugins/beauwilliams/focus.nvim)
+ [luukvbaal/stabilize.nvim](https://dotfyle.com/plugins/luukvbaal/stabilize.nvim)
### startup

+ [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
+ [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)
### tabline

+ [willothy/nvim-cokeline](https://dotfyle.com/plugins/willothy/nvim-cokeline)
### terminal-integration

+ [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim)
+ [willothy/flatten.nvim](https://dotfyle.com/plugins/willothy/flatten.nvim)
### test

+ [nvim-neotest/neotest](https://dotfyle.com/plugins/nvim-neotest/neotest)
### utility

+ [axkirillov/hbac.nvim](https://dotfyle.com/plugins/axkirillov/hbac.nvim)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
+ [NStefan002/screenkey.nvim](https://dotfyle.com/plugins/NStefan002/screenkey.nvim)
+ [code-biscuits/nvim-biscuits](https://dotfyle.com/plugins/code-biscuits/nvim-biscuits)
+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
## Language Servers

+ astro
+ cmake
+ efm
+ html
+ omnisharp
+ svelte
+ volar


 This readme was generated by [Dotfyle](https://dotfyle.com)
