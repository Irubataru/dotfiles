return {
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          lsp = {
            score_offset = 10,
          },
          buffer = {
            score_offset = -3,
          },
        },
      },
      keymap = {
        preset = "default",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
    },
  },
}
