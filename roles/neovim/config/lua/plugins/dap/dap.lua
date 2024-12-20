return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<F7>",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<F8>",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<F9>",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
    },
  },
}
