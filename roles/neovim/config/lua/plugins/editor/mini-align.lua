return {
  {
    -- A plugin to align text interactively
    "echasnovski/mini.align",
    event = "VeryLazy",
    opts = {
      mappings = {
        start = "ga",
        start_with_preview = "gA",
      },
    },
    keys = {
      {
        "ga",
        function()
          require("mini.align").make_action_normal(false)
        end,
        { expr = true, desc = "Align" },
      },
      {
        "ga",
        function()
          require("mini.align").make_action_normal(false)
        end,
        mode = "x",
        { desc = "Align" },
      },
      {
        "gA",
        function()
          require("mini.align").make_action_normal(true)
        end,
        { expr = true, desc = "Align with preview" },
      },
      {
        "gA",
        function()
          require("mini.align").make_action_normal(true)
        end,
        mode = "x",
        { desc = "Align with preview" },
      },
    },
  },
}
