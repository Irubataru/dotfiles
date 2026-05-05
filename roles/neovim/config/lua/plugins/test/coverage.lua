return {
  {
    "andythigpen/nvim-coverage",
    cmd = { "Coverage", "CoverageToggle", "CoverageSummary" },
    config = true,
    keys = {
      {
        "<leader>tc",
        function()
          local coverage = require("coverage")
          coverage.load(true)
        end,
        desc = "Toggle test coverage",
      },
      {
        "<leader>tC",
        function()
          local coverage = require("coverage")
          coverage.load(false)
          coverage.summary()
        end,
        desc = "Show test coverage summary",
      },
    },
  },
}
