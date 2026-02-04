return {
  {
    "rcarriga/nvim-dap-ui",
    opts = {
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.6,
            },
            {
              id = "stacks",
              size = 0.4,
            },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            {
              id = "scopes",
              size = 0.25,
            },
            {
              id = "breakpoints",
              size = 0.25,
            },
            {
              id = "stacks",
              size = 0.25,
            },
            {
              id = "watches",
              size = 0.25,
            },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "console",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 16,
        },
      },
    },
    keys = {
      { "<leader>du", false },
      {
        "<leader>dut",
        function()
          require("dapui").toggle({ layout = 1 })
          require("dapui").toggle({ layout = 3 })
        end,
        desc = "Toggle DAP UI",
      },
      {
        "<leader>duT",
        function()
          require("dapui").toggle({ layout = 2 })
          require("dapui").toggle({ layout = 3 })
        end,
        desc = "Toggle DAP UI (detailed)",
      },
      {
        "<leader>dv",
        function()
          vim.g.__dapui_prev_win = vim.g.__dapui_prev_win or nil

          if vim.g.__dapui_prev_win and vim.api.nvim_win_is_valid(vim.g.__dapui_prev_win) then
            vim.api.nvim_set_current_win(vim.g.__dapui_prev_win)
            vim.g.__dapui_prev_win = nil
            return
          end

          vim.g.__dapui_prev_win = vim.api.nvim_get_current_win()

          local scopes_buffer = require("utils.buffers").find_buffer("dapui_scopes")

          if not scopes_buffer then
            vim.notify("DAP scopes window not found", vim.log.levels.WARN)
            return
          end

          vim.api.nvim_set_current_win(scopes_buffer)
        end,
        desc = "Open variables",
      },
      {
        "<leader>dV",
        function()
          local dapui = require("dapui")
          dapui.float_element("scopes", { enter = true, position = "center" })
        end,
        desc = "Open variables in float",
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
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({ layout = 1 })
        dapui.open({ layout = 3 })
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
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
