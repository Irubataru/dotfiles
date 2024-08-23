return {
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    init = function()
      vim.api.nvim_set_hl(0, "NavicSeparator", { default = false, link = "Normal" })
    end,
    opts = {
      separator = "  ",
    },
    keys = {
      {
        "<leader>ub",
        function()
          require("barbecue.ui").toggle()
        end,
        desc = "Toggle barbecue",
      },
    },
  },
}
