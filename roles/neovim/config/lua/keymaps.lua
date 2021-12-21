-- vim: foldmethod=marker

local keymap = vim.api.nvim_set_keymap
local wk = require("which-key")

-- Navigation
-- {{{

-- Dont move with the arrows
keymap("n", "<Up>", "<NOP>", { noremap = true })
keymap("n", "<Down>", "<NOP>", { noremap = true })
keymap("n", "<Left>", "<NOP>", { noremap = true })
keymap("n", "<Right>", "<NOP>", { noremap = true })

-- Fold movement
-- Replace the zj zk calls to move to next closed fold
keymap(
  "n",
  "zj",
  ":call NextClosedFold('j')<CR>",
  { noremap = true, silent = true }
)
keymap(
  "n",
  "zk",
  ":call NextClosedFold('k')<CR>",
  { noremap = true, silent = true }
)

-- Tab movement
keymap("n", "<C-Left>", ":tabp<CR>", { noremap = true })
keymap("n", "<C-Right>", ":tabn<CR>", { noremap = true })

-- File navigation
-- {{{

-- Start a :e with the dir of the current buffer already filled in
keymap("n", ",e", ":e <C-R>=Get_Relative_Cwd() <CR>", { noremap = true })

-- }}}

-- }}}

-- UI Related
-- {{{

keymap("n", "<Leader><Leader>", "zz", { noremap = true })

wk.register({
  z = {
    name = "+folds",
    z = { ":let &scrolloff=810-&scrolloff<CR>", "toogle-scroll-distance" }
  }
}, {prefix = "<leader>"})

wk.register({
  ["["] = {
    o = {
      name = "quickfix",
      q = { ":copen<cr>", "open-quickfix" }
    }
  },
  ["]"] = {
    o = {
      name = "quickfix",
      q = { ":cclose<cr>", "close-quickfix" }
    }
  }
})

-- Toggles for quickfix consistent with vim-unimpaired
-- Toggle-command from the vim-togglelist plugin
-- keymap('n', 'coq', vim.cmd([[:call ToggleQuickfixList()<CR>]]), {noremap=true, silent=true, script=true})
keymap("n", "[oq", ":copen<cr>", { noremap = true })
keymap("n", "]oq", ":cclose<cr>", { noremap = true })

-- Disable EX mode
keymap("n", "Q", "<NOP>", { noremap = true })

-- }}}

-- Other keymaps
-- {{{

-- Source changes to .vim
-- keymap('n', '<leader><cr>', '<cmd>lua require("functions").reload()<cr>', {noremap=true});

-- Yank to clipboard
keymap("n", "<leader>y", '"+y', { noremap = true })
keymap("v", "<leader>y", '"+y', { noremap = true })
keymap("n", "<leader>Y", 'gg"+yG', { noremap = true })

-- Better cursor positioning on searching
keymap("n", "n", "nzzzv", { noremap = true })
keymap("n", "N", "Nzzzv", { noremap = true })
keymap("n", "J", "miJ`i", { noremap = true })

-- Moving text
keymap("v", "J", ":m '>+1<cr>gv=gv", { noremap = true })
keymap("v", "K", ":m '<-2<cr>gv=gv", { noremap = true })
keymap("i", "<C-j>", "<esc>:m .+1<cr>==", { noremap = true })
keymap("i", "<C-k>", "<esc>:m .-2<cr>==", { noremap = true })
keymap("n", "<leader>j", ":m .+1<cr>==", { noremap = true })
keymap("n", "<leader>k", ":m .-2<cr>==", { noremap = true })

-- Undo break points
keymap("i", ",", ",<c-g>u", { noremap = true })
keymap("i", " ", " <c-g>u", { noremap = true })
keymap("i", "!", "!<c-g>u", { noremap = true })
keymap("i", "?", "?<c-g>u", { noremap = true })

-- Unknown next greatest remap
keymap("x", "<leader>p", '"_dP', { noremap = true })

-- }}}

-- Terminal related
-- {{{

keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- }}}
