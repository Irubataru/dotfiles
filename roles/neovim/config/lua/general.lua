local opt = vim.opt

opt.backupdir = vim.fn.expand "~/.tmp"

opt.diffopt = "filler,vertical"

--Command line file completion
opt.wildmode = "longest,list,full" -- bash-like filename autocompletion
opt.wildmenu = true                   -- zsh-like filename list chooser

-- Files in general shouldn't start folded, can fix individual files with autocmd
-- set foldlevelstart=99

-- Use treesitter to fold
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Make it so I can switch buffers even if they have changed
opt.hidden = true

-- Timeoutlen is used for e.g. the which-key plugin (default value 1000 ms)
opt.timeoutlen = 500

vim.g.tex_flavor = "--latex"

-- Remove line numbering in new terminals
vim.cmd [[autocmd TermOpen term://* set nonumber]]
vim.cmd [[autocmd TermOpen term://* set norelativenumber]]

-- Run e on all elements of the arglist
-- This is so that I populate a "tab" in CtrlSpace with all files from the arglist
--vim.cmd [[au VimEnter * nested silent! exe "argdo set eventignore-=Syntax e" | bn]]

-- Backup if necessary
vim.cmd([[
if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif
]])

-- Colors and styling
--{{{

vim.cmd [[set t_Co=256]]
vim.cmd [[set t_ut=]] --Fix for bg colour issues in tmux http://sunaku.github.io/vim-256color-bce.html

opt.conceallevel = 1 --Use vims new conceal feature
opt.concealcursor = ""

--}}}

-- Settings related to text behaviour and margins
--{{{

opt.scrolloff = 10 -- number of lines to keep above and below cursor
opt.number = true -- show linenumbers
opt.relativenumber = true

opt.wrap = true -- wrap text
opt.linebreak = true -- break lines when wrapping text
opt.list = false
opt.cinoptions = "N-s" -- namespaces doesn't count towards indentation
opt.textwidth = 80
opt.wrapmargin = 0

opt.formatoptions:append('l')

--}}}

--- Tabs are defined as 2 spaces
---{{{

opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2

---}}}

--- Other settings
---{{{

opt.inccommand = "nosplit"
opt.laststatus = 2
opt.showmode = false

---}}}
