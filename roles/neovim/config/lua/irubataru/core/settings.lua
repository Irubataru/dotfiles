local opt = vim.opt

opt.number = true -- show linenumbers
opt.relativenumber = true

-- Start diff-mode in vertical split, ignore all whitespace
opt.diffopt = "filler,vertical,iwhiteall"

-- Highlight the current cursorline
opt.cursorline = true

-- Backup if necessary
opt.backupdir = vim.fn.expand("~/.tmp")

vim.cmd([[
if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif
]])

opt.textwidth = 80

--- Tabs are defined as 2 spaces
---{{{

opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2

---}}}

-- Colors and styling
--{{{

-- Additional colours support
opt.termguicolors = true

vim.cmd([[set t_Co=256]])
vim.cmd([[set t_ut=]]) --Fix for bg colour issues in tmux http://sunaku.github.io/vim-256color-bce.html

opt.conceallevel = 1 --Use vims new conceal feature
opt.concealcursor = ""

--}}}

vim.defer_fn(function()
  -- Treat both system clipboards as the same
  opt.clipboard = "unnamedplus"

  -- Splits should be to the right and below
  opt.splitbelow = true
  opt.splitright = true

  -- Use treesitter to fold
  opt.foldmethod = "expr"
  opt.foldexpr = "nvim_treesitter#foldexpr()"

  --Command line file completion
  opt.wildmode = "longest,list,full" -- bash-like filename autocompletion
  opt.wildmenu = true -- zsh-like filename list chooser

  -- Make it so I can switch buffers even if they have changed
  opt.hidden = true

  -- Disable mouse integration
  opt.mouse = nil

  -- Timeoutlen is used for e.g. the which-key plugin (default value 1000 ms)
  opt.timeoutlen = 500

  -- Settings related to text behaviour and margins
  --{{{

  opt.scrolloff = 10 -- number of lines to keep above and below cursor

  opt.wrap = true -- wrap text
  opt.linebreak = true -- break lines when wrapping text
  opt.list = false
  opt.cinoptions = "N-s" -- namespaces doesn't count towards indentation
  opt.wrapmargin = 0

  opt.formatoptions:append("l")

  --}}}

  --- Other settings
  ---{{{
  opt.showmode = false
  opt.laststatus = 2

  opt.inccommand = "nosplit"

  vim.g.tex_flavor = "--latex"

  ---}}}
end, 1)
