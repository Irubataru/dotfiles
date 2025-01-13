return {
  {
    "willothy/flatten.nvim",
    opts = {
      integrations = {
        wezterm = false,
      },
    },
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
  },
}
