return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      { "folke/snacks.nvim" },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true
    end,
    keys = {
      {
        "<leader>ao",
        function()
          require("opencode").toggle()
        end,
        desc = "Toggle opencode",
        mode = { "n", "x" },
      },
    },
  },
}
