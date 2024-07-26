local M = {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  keys = {
    group = "v",
    {
      "S",
      function()
        require("nvim-surround").visual_surround({})
      end,
      desc = "Visual surround",
    },
  },
  opts = {},
}

return M
