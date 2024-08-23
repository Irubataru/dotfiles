return {
  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
    keys = {
      {
        "<leader>xq",
        function()
          require("quicker").toggle()
        end,
        desc = "Toggle quickfix",
      },
      {
        "<leader>xl",
        function()
          require("quicker").toggle({ loclist = true })
        end,
        desc = "Toggle loclist",
      },
    },
  },
}
