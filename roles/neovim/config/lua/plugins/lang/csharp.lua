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
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          handlers = {
            ["textDocument/definition"] = function(...)
              return require("omnisharp_extended").handler(...)
            end,
          },
          keys = {
            {
              "gd",
              function()
                if LazyVim.has("telescope.nvim") then
                  return require("omnisharp_extended").telescope_lsp_definitions()
                else
                  return require("omnisharp_extended").lsp_definitions()
                end
              end,
              desc = "Goto Definition",
            },
          },
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
      },
    },
  },
}
