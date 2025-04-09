return {
  {
    "frankroeder/parrot.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      providers = {
        anthropic = {
          api_key = os.getenv("ANTHROPIC_API_KEY"),
        },
        openai = {
          api_key = os.getenv("OPENAI_API_KEY"),
        },
      },
    },
    cmd = {
      "PrtChatNew",
      "PrtChatToggle",
      "PrtChatPaste",
      "PrtInfo",
      "PrtContext",
      "PrtChatFinder",
      "PrtChatDelete",
      "PrtChatRespond",
      "PrtRewrite",
      "PrtEdit",
      "PrtPrepend",
      "PrtAppend",
      "PrtNew",
      "PrtEnew",
      "PrtVnew",
      "PrtTabnew",
      "PrtRetry",
      "PrtAsk",
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>ap", group = "+parrot", icon = { icon = "🦜", color = "orange" } },
        {
          "<leader>apc",
          "<cmd>PrtAsk<cr>",
          mode = "n",
          desc = "Parrot ask",
          icon = { icon = "🦜", color = "green" },
        },
        {
          "<leader>apa",
          "<cmd>PrtChatToggle<cr>",
          mode = "n",
          desc = "Parrot chat",
          icon = { icon = "🦜", color = "green" },
        },
        {
          "<leader>apr",
          "<cmd>'<,'>PrtRewrite<cr>",
          mode = "v",
          desc = "Parrot rewrite",
          icon = { icon = "🦜", color = "green" },
        },
        {
          "<leader>ape",
          "<cmd>'<,'>PrtEdit<cr>",
          mode = "v",
          desc = "Parrot edit",
          icon = { icon = "🦜", color = "green" },
        },
        {
          "<leader>apk",
          "<cmd>'<,'>PrtPrepend<cr>",
          mode = "v",
          desc = "Parrot prepend",
          icon = { icon = "🦜", color = "green" },
        },
        {
          "<leader>apj",
          "<cmd>'<,'>PrtAppend<cr>",
          mode = "v",
          desc = "Parrot append",
          icon = { icon = "🦜", color = "green" },
        },
      },
    },
  },
}
