local add_file_to_chat = require("utils.codecompanion").add_file_to_chat

return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      { "<leader>a", group = "+ai", icon = { icon = " ", color = "green" } },
      {
        "<leader>aa",
        function()
          require("codecompanion").toggle()
        end,
        mode = "n",
        desc = "CodeCompanion chat",
        icon = { icon = " ", color = "green" },
      },
      {
        "<leader>aA",
        function()
          require("codecompanion").chat()
        end,
        mode = "n",
        desc = "CodeCompanion chat (new)",
        icon = { icon = " ", color = "green" },
      },
      {
        "<leader>ac",
        function()
          require("codecompanion").actions({})
        end,
        mode = "n",
        desc = "CodeCompanion actions",
        icon = { icon = " ", color = "green" },
      },
      {
        "<leader>ac",
        "<cmd>'<,'>CodeCompanionActions<cr>",
        mode = "v",
        desc = "CodeCompanion actions",
        icon = { icon = " ", color = "green" },
      },
      {
        "<cmd>CodeCompanion /document<cr>",
        "<leader>agd",
        mode = "v",
        desc = "CodeCompanion actions",
        icon = { icon = " ", color = "green" },
      },
      {
        "<leader>ad",
        "<cmd>CodeCompanionChat Add<cr>",
        mode = "v",
        desc = "CodeCompanion add to chat",
        icon = { icon = " ", color = "green" },
      },
      {
        "<leader>ad",
        function()
          add_file_to_chat()
        end,
        mode = "n",
        desc = "CodeCompanion add current buffer to chat",
        icon = { icon = " ", color = "green" },
      },
      {
        "<leader>ae",
        "<cmd>CodeCompanion #buffer /explain<cr>",
        mode = "n",
        desc = "CodeCompanion explain current buffer",
        icon = { icon = " ", color = "orange" },
      },
      {
        "<leader>ae",
        "<cmd>CodeCompanion /explain<cr>",
        mode = "v",
        desc = "CodeCompanion explain selection",
        icon = { icon = " ", color = "orange" },
      },
      { "<leader>ag", group = "+generate", icon = { icon = " ", color = "green" } },
      -- {
      --   "<leader>agd",
      --   function() end,
      --   mode = "v",
      --   desc = "Generate documentation",
      --   icon = { icon = "󰷈 ", color = "white" },
      -- },
    },
  },
}
