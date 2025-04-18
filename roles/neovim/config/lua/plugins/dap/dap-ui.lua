return {
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      { "<leader>du", false },
      {
        "<leader>dut",
        function()
          require("dapui").toggle({})
        end,
        desc = "Toggle DAP UI",
      },
      {
        "<leader>dus",
        function()
          local scopes_buffer = require("utils.buffers").find_buffer("dapui_scopes")

          if not scopes_buffer then
            vim.notify("DAP scopes window not found", vim.log.levels.WARN)
            return
          end

          vim.api.nvim_set_current_win(scopes_buffer)
        end,
        desc = "Open scopes",
      },
      {
        "<leader>duc",
        function()
          local console_buffer = require("utils.buffers").find_buffer("dapui_console")

          if not console_buffer then
            vim.notify("DAP console window not found", vim.log.levels.WARN)
            return
          end

          vim.api.nvim_set_current_win(console_buffer)
        end,
        desc = "Open console",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>du", group = "+dap ui" },
      },
    },
  },
}
