return {
  {
    "iabdelkareem/csharp.nvim",
    dependencies = {
      "williamboman/mason.nvim", -- Required, automatically installs omnisharp
      "mfussenegger/nvim-dap",
      "Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
    },
    ft = { "cs" },
    opts = {
      lsp = {
        omnisharp = {
          enable = false,
        },
      },
    },
    init = function()
      vim.keymap.set("n", "<leader>xa", function()
        require("csharp").fix_all()
      end, { desc = "Fix all (C#)" })

      vim.keymap.set("n", "<leader>cv", function()
        require("csharp").view_user_secrets()
      end, { desc = "View user secrets (C#)" })

      vim.keymap.set("n", "<leader>dd", function()
        require("csharp").debug_project()
      end, { desc = "Debug project" })
    end,
  },
}
