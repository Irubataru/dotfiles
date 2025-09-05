return {
  {
    "stevearc/oil.nvim",
    opts = {
      keymaps = {
        ["<BS>"] = "actions.parent",
      },
    },
    lazy = false,
    dependencies = { { "nvim-mini/mini.icons" } },
  },
}
