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
      { "saghen/blink.compat", opts = {} },
      { "Dynge/gitmoji.nvim" },
    },
    opts = {
      sources = {
        default = { "gitmoji" },
        providers = {
          gitmoji = {
            name = "gitmoji",
            module = "blink.compat.source",
            should_show_items = function(ctx, _)
              if ctx.cursor[1] ~= 1 then
                return false
              end

              return ctx.trigger.initial_character == ":"
            end,
          },
        },
      },
    },
  },
}
