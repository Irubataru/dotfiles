return {
  {
    "marilari88/neotest-vitest",
  },
  {
    "nvim-neotest/neotest",
    version = "*",
    opts = {
      adapters = {
        ["neotest-vitest"] = {},
      },
    },
  },
}
