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

  -- blink.cmp integration
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = {
      { "saghen/blink.compat", opts = { impersonate_nvim_cmp = true } },
      { "Dynge/gitmoji.nvim" },
    },
    opts = {
      sources = { compat = { "gitmoji" } },
    },
  },
}
