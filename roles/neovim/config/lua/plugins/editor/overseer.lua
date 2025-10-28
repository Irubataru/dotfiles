return {
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      opts.bottom = opts.bottom or {}
      table.insert(opts.bottom, {
        title = "Overseer runner",
        ft = "text",
        filter = function(_, _)
          return vim.b.overseer_task ~= nil
        end,
        size = {
          height = 0.3,
        },
      })
    end,
  },
}
