return {
  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "nvim-mini/mini.icons" },
    },
    opts = {
      save_key = "git_root",
      show_icons = true,
      leader_key = nil,
      buffer_leader_key = nil,
    },
    keys = {
      {
        "M",
        function()
          require("arrow.buffer_ui").openMenu()
        end,
        mode = "n",
        { noremap = true, silent = true, desc = "Arrow buffer mappings" },
      },
      {
        "<A-m>",
        function()
          require("arrow.ui").openMenu()
        end,
        mode = "n",
        { noremap = true, silent = true, desc = "Arrow file mappings" },
      },
    },
  },
}
