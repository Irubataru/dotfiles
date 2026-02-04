return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "ruff_fix", "ruff_organize_imports", lsp_format = "first" },
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("debugpy-adapter")
      table.insert(require("dap").configurations.python, {
        type = "python",
        request = "launch",
        name = "Django runserver",
        program = "manage.py",
        args = { "runserver" },
      })
    end,
  },
}
