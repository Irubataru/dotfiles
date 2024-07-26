local keymap = vim.keymap.set

-- TODO: Legendary seems to have stopped working
require("legendary").setup({ which_key = { auto_register = true } })

local wk = require("which-key")
-- local wk_operators = require("which-key.plugins.presets").operators

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
  { "z", group = "fold" },
  { "zj", ":call NextClosedFold('j')<cr>", desc = "Next closed fold" },
  { "zk", ":call NextClosedFold('k')<cr>", desc = "Previous closed fold" },
})

-- Tab movement
wk.add({
  { "<leader>t", group = "tab" },
  { "<leader>tc", ":tabclose<cr>", desc = "Close tab" },
  { "<leader>tn", ":tabn<cr>", desc = "Next tab" },
  { "<leader>tp", ":tabp<cr>", desc = "Previous tab" },
})

-- Split movement
wk.add({
  { "<C-h>", "<cmd>WinShift left<cr>", desc = "Move window left" },
  { "<C-j>", "<cmd>WinShift down<cr>", desc = "Move window down" },
  { "<C-k>", "<cmd>WinShift up<cr>", desc = "Move window up" },
  { "<C-l>", "<cmd>WinShift right<cr>", desc = "Move window right" },
})

-- -- Buffer movement
wk.add({
  { "[b", "<Plug>(cokeline-focus-prev)", desc = "Goto previous buffer" },
  { "]b", "<Plug>(cokeline-focus-next)", desc = "Goto next buffer" },
}, opts)

-- Harpoon
wk.add({
  {
    "<C-p>",
    function()
      require("harpoon"):list():prev({ ui_nav_wrap = true })
    end,
    desc = "Next harpoon",
  },
  {
    "<C-n>",
    function()
      require("harpoon"):list():next({ ui_nav_wrap = true })
    end,
    desc = "Next harpoon",
  },
  {
    "<A-1>",
    function()
      require("harpoon"):list():select(1)
    end,
    desc = "Harpoon 1",
  },
  {
    "<A-2>",
    function()
      require("harpoon"):list():select(2)
    end,
    desc = "Harpoon 2",
  },
  {
    "<A-3>",
    function()
      require("harpoon"):list():select(3)
    end,
    desc = "Harpoon 3",
  },
  {
    "<A-4>",
    function()
      require("harpoon"):list():select(4)
    end,
    desc = "Harpoon 4",
  },

  { "<leader>h", group = "harpoon" },
  {
    "<leader>ha",
    function()
      require("harpoon"):list():add()
    end,
    desc = "Add harpoon mark",
  },
  {
    "<leader>hv",
    function()
      require("harpoon")
      require("telescope").extensions.harpoon.marks()
    end,
    desc = "List harpoon marks",
  },
}, opts)

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
  { "<C-f>", ":NvimTreeFindFileToggle<CR>", desc = "Open file tree" },
  { "<C-Up>", ":resize -2<CR>", desc = "Resize window (shrink vertical)" },
  { "<C-Down>", ":resize +2<CR>", desc = "Resize window (expand vertical)" },
  { "<C-Left>", ":vertical resize -2<CR>", desc = "Resize window (shrink horizontal)" },
  { "<C-Right>", ":vertical resize +2<CR>", desc = "Resize window (expand horizontal)" },
  {
    "<C-b>",
    function()
      require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({ previewer = false }))
    end,
    desc = "Find buffer",
  },
}, opts)

-- Window actions
wk.add({
  { "<C-W>", group = "window" },
  { "<C-W>m", "<cmd>WinShift<cr>", desc = "Enter Win-Move mode" },
  { "<C-W>z", "<cmd>NeoZoomToggle<cr>", desc = "Toggle zoom" },
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

-- TODO: Figure out how to use unimpaired keymaps for myself
-- keymap("n", "yoq", "<cmd>QFToggle!<cr>", opts)

-- Register replace
wk.add({
  { "gx", "<Plug>ReplaceWithRegisterOperator", desc = "Replace with register" },
  { "gxx", "<Plug>ReplaceWithRegisterLine", desc = "Replace line with register" },
}, opts)

wk.add({
  mode = "x",
  { "gx", "<Plug>ReplaceWithRegisterVisual", desc = "Replace with register" },
})

-- wk_operators["gx"] = "Replace with register"

-- }}}

-- Goto
wk.add({
  { "g", group = "goto" },
  { "gs", "<cmd>AerialToggle<cr>", desc = "Symbols (aerial)" },
  {
    "gt",
    function()
      require("neotest").summary.toggle()
    end,
    desc = "Toggle test summary",
  },
})

-- DAP

wk.add({
  {
    "<F7>",
    function()
      require("dap").step_into()
    end,
    desc = "Debug step into",
  },
  {
    "<F8>",
    function()
      require("dap").step_over()
    end,
    desc = "Debug step over",
  },
  {
    "<S-F8>",
    function()
      require("dap").step_out()
    end,
    desc = "Debug step out",
  },
  {
    "<F9>",
    function()
      require("dap").continue()
    end,
    desc = "Debug continue",
  },

  { "<leader>d", group = "debug" },
  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "Continue",
  },
  {
    "<leader>dd",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "Toggle breakpoint",
  },
  {
    "<leader>de",
    function()
      require("dapui").eval()
    end,
    desc = "Evaluate under cursor",
  },
  {
    "<leader>dD",
    function()
      require("dap").set_breakpoint()
    end,
    desc = "Toggle breakpoint",
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "Step into",
  },
  {
    "<leader>do",
    function()
      require("dap").step_over()
    end,
    desc = "Step over",
  },
  {
    "<leader>dO",
    function()
      require("dap").step_out()
    end,
    desc = "Step out",
  },
  {
    "<leader>du",
    function()
      require("dapui").toggle()
    end,
    desc = "Toggle UI",
  },
  {
    "<leader>dx",
    function()
      require("dap").terminate()
    end,
    desc = "Terminate",
  },
  --   },
})

-- Focus
wk.add({
  { "<C-g>", "<cmd>TZAtaraxis<cr>", desc = "Toggle zen mode (Toggle Zen Atraxis)" },
  { "<C-y>", ":Limelight!!<CR>", desc = "Toggle limelight mode" },
  { "<F-11>", "<cmd>NeoZoomToggle<cr>", desc = "Toggle zoom" },
})

-- Toggle
wk.add({
  { "<leader>c", group = "toggle" },
  {
    "<leader>cb",
    function()
      require("nvim-biscuits").toggle_biscuits()
    end,
    desc = "Toggle biscuits",
  },
  { "<leader>cc", "<cmd>TSJToggle<cr>", desc = "Toggle split/join" },
  {
    "<leader>cf",
    function()
      require("conform").format({ async = true, lsp_fallback = true })
    end,
    desc = "Format buffer",
  },
  { "<leader>cq", "<cmd>QFToggle!<cr>", desc = "Toggle quickfix list" },
  { "<leader>cj", "<cmd>TSJJoin<cr>", desc = "Join content" },
  { "<leader>cs", "<cmd>TSJSplit<cr>", desc = "Split content" },
})

-- Find
wk.add({
  {
    "<leader>F",
    function()
      require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
    end,
    desc = "Find text",
  },

  { "<leader>f", group = "find" },
  {
    "<leader>fb",
    function()
      require("telescope.builtin").buffers()
    end,
    desc = "Find buffers",
  },
  { "<leader>fC", "<cmd>Legendary commands<cr>", desc = "Find commands" },
  {
    "<leader>fd",
    function()
      require("telescope.builtin").lsp_definitions()
    end,
    desc = "Find definitions",
  },
  {
    "<leader>fe",
    function()
      require("telescope.builtin").lsp_workspace_diagnostics({ severity = 1 })
    end,
    desc = "Find errors",
  },
  {
    "<leader>fE",
    function()
      require("telescope.builtin").lsp_workspace_diagnostics()
    end,
    desc = "Find all diagnostics",
  },
  {
    "<leader>ff",
    function()
      require("telescope").extensions.smart_open.smart_open()
    end,
    desc = "Find files",
  },
  {
    "<leader>fF",
    function()
      require("triptych").toggle_triptych()
    end,
    desc = "Open file navigator",
  },
  {
    "<leader>fg",
    function()
      require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
    end,
    desc = "Find text",
  },
  {
    "<leader>fh",
    function()
      require("telescope.builtin").help_tags()
    end,
    desc = "Find help",
  },
  {
    "<leader>fi",
    function()
      require("telescope.builtin").lsp_implementations()
    end,
    desc = "Find implementations",
  },
  { "<leader>fk", "<cmd>Legendary keymaps<cr>", desc = "Find keymaps (legendary)" },
  { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Find projects" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open recent file" },
  {
    "<leader>fR",
    function()
      require("telescope.builtin").lsp_references()
    end,
    desc = "Find references",
  },
  { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODO items" },
  {
    "<leader>fv",
    function()
      require("irubataru.modules.telescope.search_dotfiles").search_dotfiles()
    end,
    desc = "Vim dotfiles",
  },
  {
    "<leader>fV",
    function()
      require("irubataru.modules.telescope.search_dotfiles").search_dotfiles_grep()
    end,
    desc = "Vim dotfiles text search",
  },
})

-- Git
wk.add({
  { "<leader>g", group = "git" },

  {
    "<leader>gb",
    function()
      require("gitsigns").blame_line()
    end,
    desc = "Blame",
  },
  { "<leader>gc", "<cmd>Gcommit<CR>", desc = "git commit" },
  {
    "<leader>gj",
    function()
      require("gitsigns").next_hunk()
    end,
    desc = "Next hunk",
  },
  {
    "<leader>gk",
    function()
      require("gitsigns").prev_hunk()
    end,
    desc = "Prev hunk",
  },
  { "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "git diff" },
  { "<leader>gg", "<cmd>aboveleft 16split|0Git<CR>", desc = "git status" },
  { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "git file history" },
  { "<leader>gl", "<cmd>DiffviewOpen<CR>", desc = "git diff log" },
  { "<leader>gr", "<cmd>0Gllog<cr>", desc = "git show file revisions in quickfix list" },
})

-- Insert
wk.add({
  { "<leader>i", group = "insert" },
  { "<leader>is", "<cmd>IconPickerNormal symbols nerd_font<cr>", desc = "Insert symbol" },
  { "<leader>ie", "<cmd>IconPickerNormal emoji<cr>", desc = "Insert emoji" },

  { "<leader>iy", group = "yank" },
  { "<leader>iys", "<cmd>IconPickerYank symbols nerd_font<cr>", desc = "Yank symbol" },
  { "<leader>iye", "<cmd>IconPickerYank emoji<cr>", desc = "Yank emoji" },
})

-- Marks
wk.add({
  { "<leader>m", group = "marks" },
  {
    "<leader>md",
    function()
      require("recall").clear()
    end,
    desc = "Delete mark",
  },
  {
    "<leader>ml",
    function()
      require("telescope").extensions.recall.recall()
    end,
    desc = "List marks (telescope)",
  },
  {
    "<leader>mm",
    function()
      require("recall").toggle()
    end,
    desc = "Toggle global mark",
  },
  {
    "<leader>mn",
    function()
      require("recall").goto_next()
    end,
    desc = "Go to next mark",
  },
  {
    "<leader>mp",
    function()
      require("recall").goto_prev()
    end,
    desc = "Go to previous mark",
  },
})

-- Run
wk.add({
  { "<leader>r", group = "run" },
  { "<leader>rr", "<cmd>OverseerRun<cr>", desc = "Run a task" },
  { "<leader>rR", "<cmd>LspRestart<cr>", desc = "Restart the LSP" },
  { "<leader>rv", "<cmd>OverseerToggle<cr>", desc = "Toggle task status view" },
})

-- Package manager
wk.add({
  { "<leader>p", group = "package manager" },
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

-- Tests
wk.add({
  { "<leader>t", group = "tests" },
  {
    "<leader>td",
    function()
      require("neotest").run.run({ strategy = "dap" })
    end,
    desc = "Debug test under cursor",
  },
  {
    "<leader>th",
    function()
      require("neotest").output.open()
    end,
    desc = "Open test output under cursor",
  },
  {
    "<leader>tH",
    function()
      require("neotest").output_panel.toggle()
    end,
    desc = "Open test output",
  },
  {
    "<leader>tt",
    function()
      require("neotest").run.run()
    end,
    desc = "Run test under cursor",
  },
})

-- Terminal
wk.add({
  { "<leader>T", group = "terminal" },
  {
    "<leader>Tn",
    function()
      require("irubataru.modules.toggleterm").node_toggle()
    end,
    desc = "Node",
  },
  {
    "<leader>Tg",
    function()
      require("irubataru.modules.toggleterm").lazy_git_toggle()
    end,
    desc = "Lazygit",
  },
  {
    "<leader>Tp",
    function()
      require("irubataru.modules.toggleterm").python_toggle()
    end,
    desc = "Python",
  },
  {
    "<leader>Tt",
    function()
      require("irubataru.modules.toggleterm").toggle_filetype()
    end,
    desc = "Filetype",
  },
  { "<leader>Tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
  { "<leader>Th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
  { "<leader>Tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },
})

-- Window
wk.add({
  { "<leader>w", group = "window" },
  { "<leader>wG", "<cmd>lua require('shade').toggle()<cr>", desc = "Toggle shade" },
  { "<leader>wo", "<cmd>only<cr>", desc = "Only this window" },
  { "<leader>ww", "<cmd>WinShift<cr>", desc = "Enter Win-Move mode" },
  { "<leader>wz", "<cmd>NeoZoomToggle<cr>", desc = "Toggle zoom" },
  { "<leader>w+", "<cmd>lua require('shade').brightness_up()<cr>", desc = "Brightness up (shade)" },
  { "<leader>w-", "<cmd>lua require('shade').brightness_down()<cr>", desc = "Brightness down (shade)" },
})

-- Diagnostics
wk.add({
  { "<leader>x", group = "diagnostics" },
  { "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", desc = "Document diagnostics" },
  { "<leader>xl", "<cmd>Trouble loclist<cr>", desc = "Location list" },
  { "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = "To quickfix list" },
  { "<leader>xt", "<cmd>Trouble todo<cr>", desc = "TODO items" },
  { "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
  { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Open diagnostics" },
})

-- Folds
wk.add({
  { "<leader>z", group = "folds" },
  { "<leader>zc", "<cmd>set foldlevel=0<cr>", desc = "Close all folds" },
  { "<leader>zo", "<cmd>set foldlevel=99<cr>", desc = "Open all folds" },
  { "<leader>zz", ":let &scrolloff=810-&scrolloff<CR>", desc = "Toggle scroll distance" },
})

-- Visual mode
wk.add({
  group = "v",
  {
    "S",
    function()
      require("nvim-surround").visual_surround({})
    end,
    desc = "Visual surround",
  },
  { "<leader>d", group = "diff" },
  { "<leader>da", "<cmd>Linediff<cr>", desc = "Linediff add" },
})


-- Terminal related
-- {{{

keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)

-- }}}
