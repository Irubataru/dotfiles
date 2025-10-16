return {
  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "nvim-mini/mini.icons" },
    },
    opts = {
      save_key = "git_root",
      show_icons = true,
      buffer_leader_key = "M", -- Per Buffer Mappings
    },
    keys = {
      {
        "M",
        "Arrow (buffer)",
      },
    },
  },
}
