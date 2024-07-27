-- Debug Adapter Protocol client implementation for Neovim

local M = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    {
      "LiadOz/nvim-dap-repl-highlights",
      build = function ()
        require('nvim-dap-repl-highlights').setup()
      end
    }
  },
}

M.keys = {
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
}

M.config = function()
  require("dap.ext.vscode").load_launchjs()

  -- Syntax highlighting in DAP REPL
  require("nvim-dap-repl-highlights").setup()

  -- Set up adapters
  require("irubataru.modules.dap.adapters").setup()

  -- TODO: Loop over languages in languages directory
  require("irubataru.modules.languages.cpp.dap").setup()
  require("irubataru.modules.languages.python.dap").setup()
  require("irubataru.modules.languages.rust.dap").setup()

  local dap = require("dap")
  dap.listeners.after.event_initialized["dap_keybinds"] = function()
    require("irubataru.core.keymaps.dap").bind()
  end
  dap.listeners.before.event_terminated["dap_keybinds"] = function()
    require("irubataru.core.keymaps.dap").unbind()
  end
  dap.listeners.before.event_exited["dap_keybinds"] = function()
    require("irubataru.core.keymaps.dap").unbind()
  end

  require("dapui")
end

return M
