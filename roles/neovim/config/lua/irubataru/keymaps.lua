-- vim: foldmethod=marker

local M = {}

local keymap = vim.api.nvim_set_keymap
local wk = require("which-key")
local wk_operators = require("which-key.plugins.presets").operators

local opts = { noremap = true, silent = true }
local leader_opts = { noremap = true, silent = true, prefix = "<Leader>" }
local term_opts = { silent = true }

-- Navigation
-- {{{

-- Dont move with the arrows
keymap("n", "<Up>", "<NOP>", { noremap = true })
keymap("n", "<Down>", "<NOP>", { noremap = true })
keymap("n", "<Left>", "<NOP>", { noremap = true })
keymap("n", "<Right>", "<NOP>", { noremap = true })

-- Fold movement
-- Replace the zj zk calls to move to next closed fold
wk.register({
  z = {
    j = { ":call NextClosedFold('j')<cr>", "Next closed fold" },
    k = { ":call NextClosedFold('k')<cr>", "Previous closed fold" },
  },
}, opts)

-- Tab movement
keymap("n", "<C-Left>", ":tabp<CR>", { noremap = true })
keymap("n", "<C-Right>", ":tabn<CR>", { noremap = true })

wk.register({
  t = {
    name = "+tab",
    c = { ":tabclose<cr>", "Close tab" },
    n = { ":tabn<cr>", "Next tab" },
    p = { ":tabp<cr>", "Previous tab" },
  },
}, leader_opts)

-- Split movement
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer movement
wk.register({
  ["["] = {
    b = { "<Plug>(cokeline-focus-prev)", "Goto previous buffer" },
    B = { "<Plug>(cokeline-switch-prev)", "Switch with previous buffer" },
  },
  ["]"] = {
    b = { "<Plug>(cokeline-focus-next)", "Goto next buffer" },
    B = { "<Plug>(cokeline-switch-next)", "Switch with next buffer" },
  },
}, opts)

-- File navigation
-- {{{

-- Start a :e with the dir of the current buffer already filled in
keymap("n", ",e", ":e <C-R>=Get_Relative_Cwd()<CR>", opts)
-- keymap("n", ",e", ":e <C-R>=lua require('irubataru.functions').get_file_directory()<CR>", opts)

-- File tree
keymap("n", "<C-N>", ":NvimTreeFindFileToggle<CR>", {})

-- }}}

-- }}}

-- UI Related
-- {{{

-- Resize splits with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Center the window
wk.register({
  ["<Leader><Leader>"] = { "zz", "Center view" },
}, opts)

wk.register({
  ["["] = {
    o = {
      name = "quickfix",
      q = { ":copen<cr>", "open-quickfix" },
    },
  },
  ["]"] = {
    o = {
      name = "quickfix",
      q = { ":cclose<cr>", "close-quickfix" },
    },
  },
}, opts)

keymap("n", "<C-b>", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)

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
keymap("v", "<C-j>", ":m '>+1<cr>gv=gv", { noremap = true })
keymap("v", "<C-k>", ":m '<-2<cr>gv=gv", { noremap = true })
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

-- Register replace
wk.register({
  gx = { "<Plug>ReplaceWithRegisterOperator", "Replace with register" },
  gxx = { "<Plug>ReplaceWithRegisterLine", "Replace line with register" },
}, { mode = "n" })

wk.register({
  gx = { "<Plug>ReplaceWithRegisterVisual", "Replace with register" },
}, { mode = "x" })

wk_operators["gx"] = "Replace with register"

-- }}}

-- Plugin keymaps
-- {{{

wk.register({
  d = {
    name = "+diff",
    r = { ":LinediffReset<cr>", "Linediff reset" },
  },
  f = {
    name = "+find",
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Find buffers" },
    C = { "<cmd>Telescope commands<cr>", "Find commands" },
    e = { "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics({severity = 1})<cr>", "Find errors" },
    E = { "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", "Find all diagnostics" },
    f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", "Find files" },
    g = {
      "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy())<cr>",
      "Find text",
    },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Find help" },
    k = { "<cmd>Telescope keymaps<cr>", "Find keymaps" },
    p = { "<cmd>Telescope projects<cr>", "Find projects" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" },
    v = { "<cmd>lua require('irubataru.plugins.telescope').search_dotfiles()<cr>", "Vim dotfiles" },
  },
  F = { "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy())<cr>", "Find text" },
  g = {
    name = "+git",
    b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    c = { ":Gcommit<CR>", "git commit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev hunk" },
    d = { ":Gdiffsplit<CR>", "git diff" },
    g = { ":aboveleft 16split|0Git<CR>", "git status" },
    h = { ":DiffviewFileHistory<CR>", "git file history" },
    l = { ":DiffviewOpen<CR>", "git diff log" },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  t = {
    name = "Terminal",
    n = { "<cmd>lua require('irubataru.plugins.toggleterm').node_toggle()<cr>",  "Node" },
    g = { "<cmd>lua require('irubataru.plugins.toggleterm').lazy_git_toggle()<cr>", "Lazygit" },
    p = { "<cmd>lua require('irubataru.plugins.toggleterm').python_toggle()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
  x = {
    name = "+diagnostics",
    d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Document diagnostics" },
    l = { "<cmd>Trouble loclist<cr>", "Location list" },
    q = { "<cmd>Trouble quickfix<cr>", "To quickfix list" },
    w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Workspace diagnostics" },
    x = { "<cmd>Trouble<cr>", "Open diagnostics" },
  },
  z = {
    name = "+folds",
    z = { ":let &scrolloff=810-&scrolloff<CR>", "toogle-scroll-distance" },
  },
}, {
  prefix = "<leader>",
})

wk.register({
  d = {
    name = "+diff",
    a = { ":Linediff<CR>", "Linediff add" },
  },
}, {
  mode = "v",
  prefix = "<leader>",
})

-- LSP
-- {{{

-- The LSP keymaps are loaded by lspconfig[].on_attach and are therefore provided as a function
M.register_lsp_keymaps = function(bufnr)
  local wk = require("which-key")

  wk.register({
    g = {
      name = "+goto",
      d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definitions" },
      D = { "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", "Preview definition" },
      i = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "Implementations" },
      l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Hover diagnostic" },
      r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "References" },
      R = { "<cmd>Trouble lsp_references<cr>", "Show references" },
      s = { "<cmd>lua require('telescope.builtin')lsp_document_symbols()<cr>", "Symbols (document)" },
      S = { "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", "Symbols (workspace)" },
    },
    K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Lsp hover" },
    ["<a-cr>"] = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Code actions" },
  }, { silent = true, noremap = true, buffer = bufnr })

  wk.register({
    c = {
      f = { "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", "Format file" },
    },
    r = {
      name = "+refactor",
      a = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Code actions" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    },
  }, {
    prefix = "<leader>",
    silent = true,
    noremap = true,
    buffer = bufnr,
  })

  wk.register({
    ["<c-s>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature help" },
  }, {
    mode = "i",
    silent = true,
    noremap = true,
    buffer = bufnr,
  })

  wk.register({
    c = {
      f = { "<cmd>lua vim.lsp.buf.range_formatting()<cr>", "Format file" },
    },
  }, {
    mode = "v",
    prefix = "<leader>",
    silent = true,
    noremap = true,
    buffer = bufnr,
  })
end

-- }}}

-- Commenter
-- {{{

wk.register({
  g = {
    c = {
      name = "+comment",
      c = "Toggle comment line",
      b = "Toggle comment line (block style)",
    },
  },
})

wk.register({
  g = {
    c = "Toggle comment",
    b = "Toggle comment (block style)",
  },
}, {
  mode = "v",
})

-- }}}

-- EasyAlign
-- {{{

wk.register({
  g = {
    a = { "<Plug>(EasyAlign)", "easy align" },
  },
})

wk.register({
  g = {
    a = { "<Plug>(EasyAlign)", "easy align" },
  },
}, {
  mode = "x",
})

-- }}}

-- Goyo
-- {{{

keymap("n", "<C-g>", ":Goyo<CR>", { noremap = true, silent = true })

-- }}}

-- Limelight
-- {{{

keymap("n", "<C-y>", ":Limelight!!<CR>", { noremap = true, silent = true })

-- }}}

-- }}}

-- Terminal related
-- {{{

keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- }}}

return M
