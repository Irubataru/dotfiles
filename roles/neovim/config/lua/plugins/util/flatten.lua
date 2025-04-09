return {
  {
    "willothy/flatten.nvim",
    opts = {
      integrations = {
        wezterm = false,
      },
    },
    -- Currently an issue with flatten and neotest
    enabled = false,
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
  },
}
