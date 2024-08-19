return {
  {
    "Dynge/gitmoji.nvim",
    opts = {
      completion = {
        append_space = true,
      },
    },
    ft = "gitcommit",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "gitmoji" })
    end,
  },
}
