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
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      opts.left = opts.left or {}
      opts.left = vim.tbl_filter(function(item)
        return item.ft ~= "neotest-summary"
      end, opts.left)

      opts.right = opts.right or {}
      table.insert(opts.right, {
        title = "Neotest Summary",
        ft = "neotest-summary",
      })
    end,
  },
}
