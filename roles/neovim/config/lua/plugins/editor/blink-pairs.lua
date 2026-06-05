return {
  {
    "saghen/blink.pairs",
    dependencies = "saghen/blink.lib",
    -- version = "*", -- must be on a versioned release to download
    build = function()
      require("blink.pairs").build():pwait(60000)
      -- require("blink.pairs").download():pwait(60000)
    end,
    event = { "VeryLazy" },
    opts = {
      mappings = {
        enabled = true,
        wrap = {
          ["<C-b>"] = nil,
          ["<C-S-b>"] = nil,
        },
      },
    },
  },
}
