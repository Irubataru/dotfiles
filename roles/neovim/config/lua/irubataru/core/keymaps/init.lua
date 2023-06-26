local keymap = vim.keymap.set
require("legendary").setup({ which_key = { auto_register = true } })

local wk = require("which-key")
local wk_operators = require("which-key.plugins.presets").operators

local opts = { noremap = true, silent = true }
local vopts = { mode = "v", noremap = true, silent = true }
local leader_opts = { noremap = true, silent = true, prefix = "<Leader>" }
local leader_vopts = { mode = "v", noremap = true, silent = true, prefix = "<Leader>" }
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
wk.register({
  z = {
    j = { ":call NextClosedFold('j')<cr>", "Next closed fold" },
    k = { ":call NextClosedFold('k')<cr>", "Previous closed fold" },
  },
}, opts)

-- Tab movement
wk.register({
  t = {
    name = "+tab",
    c = { ":tabclose<cr>", "Close tab" },
    n = { ":tabn<cr>", "Next tab" },
    p = { ":tabp<cr>", "Previous tab" },
  },
}, leader_opts)

-- Split movement
wk.register({
  ["<C-h>"] = { "<cmd>WinShift left<cr>", "Move window left" },
  ["<C-j>"] = { "<cmd>WinShift down<cr>", "Move window down" },
  ["<C-k>"] = { "<cmd>WinShift up<cr>", "Move window up" },
  ["<C-l>"] = { "<cmd>WinShift right<cr>", "Move window right" },
}, opts)

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

-- }}}

-- }}}

-- UI Related
-- {{{

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
  ["<C-N>"] = { ":NvimTreeFindFileToggle<CR>", "Open file tree" },
  ["<C-Up>"] = { ":resize -2<CR>", "Resize window (shrink vertical)" },
  ["<C-Down>"] = { ":resize +2<CR>", "Resize window (expand vertical)" },
  ["<C-Left>"] = { ":vertical resize -2<CR>", "Resize window (shrink horizontal)" },
  ["<C-Right>"] = { ":vertical resize +2<CR>", "Resize window (expand horizontal)" },
  ["<C-b>"] = {
    function()
      require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({ previewer = false }))
    end,
    "Find buffer",
  },
}, opts)

-- Window actions
wk.register({
  ["<C-W>"] = {
    m = { "<cmd>WinShift<cr>", "Enter Win-Move mode" },
    z = { "<cmd>NeoZoomToggle<cr>", "Toggle zoom" },
  },
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
keymap("v", "<C-j>", ":m '>+1<cr>gv=gv", opts)
keymap("v", "<C-k>", ":m '<-2<cr>gv=gv", opts)
keymap("i", "<C-j>", "<esc>:m .+1<cr>==", opts)
keymap("i", "<C-k>", "<esc>:m .-2<cr>==", opts)
keymap("n", "<leader>j", ":m .+1<cr>==", opts)
keymap("n", "<leader>k", ":m .-2<cr>==", opts)

-- Undo break points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", " ", " <c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Unknown next greatest remap
keymap("x", "<leader>p", '"_dP', opts)

-- Register replace
wk.register({
  gx = { "<Plug>ReplaceWithRegisterOperator", "Replace with register" },
  gxx = { "<Plug>ReplaceWithRegisterLine", "Replace line with register" },
}, opts)

wk.register({
  gx = { "<Plug>ReplaceWithRegisterVisual", "Replace with register" },
}, { mode = "x" })

wk_operators["gx"] = "Replace with register"

-- }}}

wk.register({
  -- Normal mode keymaps
  g = {
    s = { "<cmd>AerialToggle<cr>", "Symbols (aerial)" },
  },
  ["<C-g>"] = { "<cmd>TZAtaraxis<cr>", "Toggle zen mode (Toggle Zen Atraxis)" },
  ["<C-y>"] = { ":Limelight!!<CR>", "Toggle limelight mode" },
  ["<F7>"] = {
    function() require('dap').step_into() end,
    "Debug step into"
  },
  ["<F8>"] = {
    function() require('dap').step_over() end,
    "Debug step over"
  },
  ["<S-F8>"] = {
    function() require('dap').step_out() end,
    "Debug step out"
  },
  ["<F9>"] = {
    function() require('dap').continue() end,
    "Debug continue"
  },
  ["<F-11>"] = {
    "<cmd>NeoZoomToggle<cr>", "Toggle zoom" ,
  }
}, opts)

wk.register({
  -- Normal mode leader keymaps
  c = {
    name = "+toggle",
    b = {
      function()
        require("nvim-biscuits").toggle_biscuits()
      end,
      "Toggle biscuits",
    },
    c = { "<cmd>TSJToggle<cr>", "Toggle split/join" },
    j = { "<cmd>TSJJoin<cr>", "Join content" },
    s = { "<cmd>TSJSplit<cr>", "Split content" },
  },
  d = {
    name = "+debug",
    c = {
      function() require('dap').continue() end,
      "Continue"
    },
    d = {
      function() require('dap').toggle_breakpoint() end,
      "Toggle breakpoint"
    },
    e = {
      function() require("dapui").eval() end,
      "Evaluate under cursor"
    },
    D = {
      function() require('dap').set_breakpoint() end,
      "Toggle breakpoint"
    },
    i = {
      function() require('dap').step_into() end,
      "Step into"
    },
    o = {
      function() require('dap').step_over() end,
      "Step over"
    },
    O = {
      function() require('dap').step_out() end,
      "Step out"
    },
    u = {
      function() require('dapui').toggle() end,
      "Toggle UI"
    },
    x = {
      function() require('dap').terminate() end,
      "Terminate"
    },
  },
  f = {
    name = "+find",
    b = {
      function()
        require("telescope.builtin").buffers()
      end,
      "Find buffers",
    },
    C = { "<cmd>Legendary commands<cr>", "Find commands" },
    d = {
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      "Find definitions",
    },
    e = {
      function()
        require("telescope.builtin").lsp_workspace_diagnostics({ severity = 1 })
      end,
      "Find errors",
    },
    E = {
      function()
        require("telescope.builtin").lsp_workspace_diagnostics()
      end,
      "Find all diagnostics",
    },
    f = {
      function()
        require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({ previewer = false }))
      end,
      "Find files",
    },
    g = {
      function()
        require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
      end,
      "Find text",
    },
    h = {
      function()
        require("telescope.builtin").help_tags()
      end,
      "Find help",
    },
    i = {
      function()
        require("telescope.builtin").lsp_implementations()
      end,
      "Find implementations",
    },
    k = { "<cmd>Legendary keymaps<cr>", "Find keymaps (legendary)" },
    p = { "<cmd>Telescope projects<cr>", "Find projects" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" },
    R = {
      function()
        require("telescope.builtin").lsp_references()
      end,
      "Find references",
    },
    t = { "<cmd>TodoTelescope<cr>", "Find TODO items" },
    v = {
      function()
        require("irubataru.modules.telescope.search_dotfiles").search_dotfiles()
      end,
      "Vim dotfiles",
    },
  },
  F = {
    function()
      require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
    end,
    "Find text",
  },
  g = {
    name = "+git",
    b = {
      function()
        require("gitsigns").blame_line()
      end,
      "Blame",
    },
    c = { ":Gcommit<CR>", "git commit" },
    j = {
      function()
        require("gitsigns").next_hunk()
      end,
      "Next hunk",
    },
    k = {
      function()
        require("gitsigns").prev_hunk()
      end,
      "Prev hunk",
    },
    d = { ":Gdiffsplit<CR>", "git diff" },
    g = { ":aboveleft 16split|0Git<CR>", "git status" },
    h = { ":DiffviewFileHistory<CR>", "git file history" },
    l = { ":DiffviewOpen<CR>", "git diff log" },
  },
  i = {
    name = "+insert",
    s = { "<cmd>IconPickerNormal symbols nerd_font<cr>", "Insert symbol" },
    e = { "<cmd>IconPickerNormal emoji<cr>", "Insert emoji" },
    y = {
      name = "+yank",
      s = { "<cmd>IconPickerYank symbols nerd_font<cr>", "Yank symbol" },
      e = { "<cmd>IconPickerYank emoji<cr>", "Yank emoji" },
    },
  },
  r = {
    name = "+run",
    r = { "<cmd>OverseerRun<cr>", "Run a task" },
    R = { "<cmd>LspRestart<cr>", "Restart the LSP" },
    v = { "<cmd>OverseerToggle<cr>", "Toggle task status view" },
  },
  p = {
    name = "Package manager",
    i = {
      function()
        require("lazy").install()
      end,
      "Install",
    },
    r = {
      function()
        require("irubataru.modules.telescope.reload").reload()
      end,
      "Reload lua module",
    },
    R = {
      function()
        require("irubataru.core.functions").reload()
      end,
      "Reload all modules",
    },
    s = {
      function()
        require("lazy").home()
      end,
      "Status",
    },
    S = {
      function()
        require("lazy").sync()
      end,
      "Sync",
    },
    u = {
      function()
        require("lazy").update()
      end,
      "Update",
    },
  },
  t = {
    name = "+test",
    d = {
      function()
        require("neotest").run.run({strategy = "dap"})
      end,
      "Debug test under cursor",
    },
    h = {
      function()
        require("neotest").output.open()
      end,
      "Open test output under cursor",
    },
    H = {
      function()
        require("neotest").output_panel.toggle()
      end,
      "Open test output",
    },
    t = {
      function()
        require("neotest").run.run()
      end,
      "Run test under cursor",
    },
    T = {
      function()
        require("neotest").summary.toggle()
      end,
      "Toggle test summary",
    },
  },
  T = {
    name = "Terminal",
    n = {
      function()
        require("irubataru.modules.toggleterm").node_toggle()
      end,
      "Node",
    },
    g = {
      function()
        require("irubataru.modules.toggleterm").lazy_git_toggle()
      end,
      "Lazygit",
    },
    p = {
      function()
        require("irubataru.modules.toggleterm").python_toggle()
      end,
      "Python",
    },
    t = {
      function()
        require("irubataru.modules.toggleterm").toggle_filetype()
      end,
      "Filetype",
    },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
  w = {
    name = "+windows",
    G = { "<cmd>lua require('shade').toggle()<cr>", "Toggle shade" },
    o = { "<cmd>only<cr>", "Only this window" },
    w = { "<cmd>WinShift<cr>", "Enter Win-Move mode" },
    z = { "<cmd>NeoZoomToggle<cr>", "Toggle zoom" },
    ["+"] = { "<cmd>lua require('shade').brightness_up()<cr>", "Brightness up (shade)" },
    ["-"] = { "<cmd>lua require('shade').brightness_down()<cr>", "Brightness down (shade)" },
  },
  x = {
    name = "+diagnostics",
    d = { "<cmd>Trouble document_diagnostics<cr>", "Document diagnostics" },
    l = { "<cmd>Trouble loclist<cr>", "Location list" },
    q = { "<cmd>Trouble quickfix<cr>", "To quickfix list" },
    t = { "<cmd>Trouble todo<cr>", "TODO items" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace diagnostics" },
    x = { "<cmd>TroubleToggle<cr>", "Open diagnostics" },
  },
  z = {
    name = "+folds",
    c = { "<cmd>set foldlevel=0<cr>", "Close all folds" },
    o = { "<cmd>set foldlevel=99<cr>", "Open all folds" },
    z = { ":let &scrolloff=810-&scrolloff<CR>", "Toggle scroll distance" },
  },
}, leader_opts)

wk.register({
  -- Visual mode keymaps
  S = {
    function()
      require("nvim-surround").visual_surround()
    end,
    "Visdual surround",
  },
}, vopts)

wk.register({
  -- Visual mode leader keymaps
  d = {
    name = "+diff",
    a = { ":Linediff<CR>", "Linediff add" },
  },
}, leader_vopts)

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
}, opts)

wk.register({
  g = {
    a = { "<Plug>(EasyAlign)", "easy align" },
  },
}, {
  mode = "x",
})

-- }}}

-- Terminal related
-- {{{

keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)

-- }}}
