return {
  {
    "2giosangmitom/sqmeow.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    version = "*",
    cmd = { "Sqmeow" },
    build = function()
      -- Downloads the matching release binary. Pass 'curl', 'wget', 'powershell', or 'cargo' to choose a method.
      require("sqmeow").install()
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "sqmeow" },
        providers = {
          sqmeow = {
            name = "Sqmeow",
            module = "sqmeow.completion.blink",
          },
        },
      },
    },
  },
}
