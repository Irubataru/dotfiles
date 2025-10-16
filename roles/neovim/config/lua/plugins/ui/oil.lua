return {
  {
    "stevearc/oil.nvim",
    opts = {
      keymaps = {
        ["<BS>"] = "actions.parent",
      },
    },
    keys = {
      {
        "-",
        "<cmd>Oil<cr>",
        desc = "Open parent directory",
      },
    },
    lazy = false,
    dependencies = { { "nvim-mini/mini.icons" } },
  },
}
