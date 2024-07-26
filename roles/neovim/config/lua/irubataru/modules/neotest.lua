-- An extensible framework for interacting with tests within NeoVim.

local M = {
  "nvim-neotest/neotest",
}

M.keys = {
  {
    "gt",
    function()
      require("neotest").summary.toggle()
    end,
    desc = "Toggle test summary",
  },
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
}

M.dependencies = {
  { "nvim-lua/plenary.nvim" },
  { "nvim-treesitter/nvim-treesitter" },

  -- Adapters
  { "nvim-neotest/neotest-python" },
  { "rouge8/neotest-rust" },
  {
    "nvim-neotest/neotest-vim-test",
    dependencies = { "vim-test/vim-test" },
  },
}

M.config = function()
  require("neotest").setup({
    adapters = {
      require("neotest-vim-test")({
        ignored_filetypes = { "python", "rust" },
      }),
      require("neotest-python"),
      require("neotest-rust")({
        dap_adapter = "codelldb",
      }),
    },
    quickfix = {
      open = false,
    },
    icons = {
      child_indent = "│",
      child_prefix = "├",
      collapsed = "─",
      expanded = "╮",
      failed = "✖",
      final_child_indent = " ",
      final_child_prefix = "╰",
      non_collapsible = "─",
      passed = "✔",
      running = "🗘",
      skipped = "ﰸ",
      unknown = "?",
    },
  })
end

return M
