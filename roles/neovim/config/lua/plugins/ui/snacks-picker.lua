local buffer_picker_opts = {
  win = {
    input = {
      keys = {
        ["<C-w>"] = { "bufdelete", mode = { "n", "i" } },
      },
    },
  },
}

return {
  {
    "snacks.nvim",
    opts = {
      picker = {},
    },
    keys = {
      -- {
      --   "<c-b>",
      --   function()
      --     if not require("noice.lsp").scroll(-4) then
      --       Snacks.picker.buffers(buffer_picker_opts)
      --     end
      --   end,
      --   desc = "Buffers",
      -- },
      {
        "<leader>,",
        function()
          Snacks.picker.buffers(buffer_picker_opts)
        end,
        desc = "Buffers",
      },
      {
        "<leader>fb",
        function()
          Snacks.picker.buffers(buffer_picker_opts)
        end,
        desc = "Buffers",
      },
      {
        "<leader>F",
        function()
          Snacks.picker.grep({
            layout = {
              preset = "ivy",
            },
          })
        end,
        desc = "Find text",
      },
    },
  },
  {
    "folke/noice.nvim",
    keys = {
      -- { "<c-b>", expr = true, mode = { "i", "n", "s" }, false },
    },
  },
}
