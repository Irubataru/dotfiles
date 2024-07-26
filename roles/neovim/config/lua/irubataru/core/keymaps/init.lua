local keymap = vim.keymap.set

-- TODO: Legendary seems to have stopped working
require("legendary").setup({ which_key = { auto_register = true } })

local wk = require("which-key")
-- local wk_operators = require("which-key.plugins.presets").operators

wk.add({
  { "<leader>", group = "Leader"},
  { "g", group = "goto", icon = "󱞩"},
  { "z", group = "fold" },
  { "<C-W>", group = "window" },
  { "<leader>c", group = "toggle" },
  { "<leader>d", group = "debug" },
  { "<leader>f", group = "find" },
  { "<leader>g", group = "git" },
  { "<leader>i", group = "insert" },
  { "<leader>iy", group = "yank" },
  { "<leader>m", group = "marks" },
  { "<leader>p", group = "package manager" },
  { "<leader>r", group = "run" },
  { "<leader>t", group = "tests" },
  { "<leader>t", group = "tab" },
  { "<leader>T", group = "terminal" },
  { "<leader>w", group = "window" },
  { "<leader>x", group = "diagnostics" },
  { "<leader>z", group = "folds" },
})

wk.add({
  group = "v",
  { "<leader>d", group = "diff" },
})

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Navigation
-- {{{

-- Dont move with the arrows
keymap("n", "<Up>", "<NOP>", opts)
keymap("n", "<Down>", "<NOP>", opts)
keymap("n", "<Left>", "<NOP>", opts)
keymap("n", "<Right>", "<NOP>", opts)

-- Disable EX mode
keymap("n", "Q", "<NOP>", opts)

-- Fold movement
-- Replace the zj zk calls to move to next closed fold
wk.add({
  { "zj", ":call NextClosedFold('j')<cr>", desc = "Next closed fold" },
  { "zk", ":call NextClosedFold('k')<cr>", desc = "Previous closed fold" },
})

-- Tab movement
wk.add({
  { "<leader>tc", ":tabclose<cr>", desc = "Close tab" },
  { "<leader>tn", ":tabn<cr>", desc = "Next tab" },
  { "<leader>tp", ":tabp<cr>", desc = "Previous tab" },
})

-- File navigation
-- {{{

-- Start a :e with the dir of the current buffer already filled in
keymap("n", ",e", ":e <C-R>=Get_Relative_Cwd()<CR>", opts)
-- keymap("n", ",e", ":e <C-R>=lua require('irubataru.functions').get_file_directory()<CR>", opts)

-- }}}

-- UI Related
-- {{{

wk.add({
  {
    { "[oq", ":copen<cr>", desc = "open-quickfix" },
    { "]oq", ":cclose<cr>", desc = "close-quickfix" },
  },
  { "<C-Up>", ":resize -2<CR>", desc = "Resize window (shrink vertical)" },
  { "<C-Down>", ":resize +2<CR>", desc = "Resize window (expand vertical)" },
  { "<C-Left>", ":vertical resize -2<CR>", desc = "Resize window (shrink horizontal)" },
  { "<C-Right>", ":vertical resize +2<CR>", desc = "Resize window (expand horizontal)" },
}, opts)

-- }}}

-- Other keymaps
-- {{{

-- Yank to clipboard
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", 'gg"+yG', opts)

-- Better cursor positioning on searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "miJ`i", opts)

-- Moving text
-- keymap("v", "<C-j>", ":m '>+1<cr>gv=gv", opts)
-- keymap("v", "<C-k>", ":m '<-2<cr>gv=gv", opts)
-- keymap("i", "<C-j>", "<esc>:m .+1<cr>==", opts)
-- keymap("i", "<C-k>", "<esc>:m .-2<cr>==", opts)
-- keymap("n", "<leader>j", ":m .+1<cr>==", opts)
-- keymap("n", "<leader>k", ":m .-2<cr>==", opts)

-- Undo break points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", " ", " <c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Unknown next greatest remap
keymap("x", "<leader>p", '"_dP', opts)

-- TODO: Figure out how to use unimpaired keymaps for myself
-- keymap("n", "yoq", "<cmd>QFToggle!<cr>", opts)

-- }}}

-- Package manager
wk.add({
  {
    "<leader>pi",
    function()
      require("lazy").install()
    end,
    desc = "Install",
  },
  {
    "<leader>pr",
    function()
      require("irubataru.modules.telescope.reload").reload()
    end,
    desc = "Reload lua module",
  },
  {
    "<leader>pR",
    function()
      require("irubataru.core.functions").reload()
    end,
    desc = "Reload all modules",
  },
  {
    "<leader>ps",
    function()
      require("lazy").home()
    end,
    desc = "Status",
  },
  {
    "<leader>pS",
    function()
      require("lazy").sync()
    end,
    desc = "Sync",
  },
  {
    "<leader>pu",
    function()
      require("lazy").update()
    end,
    desc = "Update",
  },
})

-- Window
wk.add({
  { "<leader>wo", "<cmd>only<cr>", desc = "Only this window" },
  -- { "<leader>wG", "<cmd>lua require('shade').toggle()<cr>", desc = "Toggle shade" },
  -- { "<leader>w+", "<cmd>lua require('shade').brightness_up()<cr>", desc = "Brightness up (shade)" },
  -- { "<leader>w-", "<cmd>lua require('shade').brightness_down()<cr>", desc = "Brightness down (shade)" },
})

-- Folds
wk.add({
  { "<leader>zc", "<cmd>set foldlevel=0<cr>", desc = "Close all folds" },
  { "<leader>zo", "<cmd>set foldlevel=99<cr>", desc = "Open all folds" },
  { "<leader>zz", ":let &scrolloff=810-&scrolloff<CR>", desc = "Toggle scroll distance" },
})

-- Visual mode
wk.add({
  group = "v",
  { "<leader>d", group = "diff" },
})

-- Terminal related
-- {{{

keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)

-- }}}
