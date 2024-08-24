return {
  {
    -- A Neovim plugin that helps you pick Nerd Font Icons, Symbols & Emojis
    "ziontee113/icon-picker.nvim",
    cmd = { "IconPickerNormal", "IconPickerInsert", "IconPickerYank" },
    keys = {
      { "<leader>is", "<cmd>IconPickerNormal symbols nerd_font<cr>", desc = "Insert symbol" },
      { "<leader>ie", "<cmd>IconPickerNormal emoji<cr>", desc = "Insert emoji" },
      { "<leader>iys", "<cmd>IconPickerYank symbols nerd_font<cr>", desc = "Yank symbol" },
      { "<leader>iye", "<cmd>IconPickerYank emoji<cr>", desc = "Yank emoji" },
    },
    dependencies = {
      { "stevearc/dressing.nvim" },
    },
    opts = {
      disable_legacy_commands = true,
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>i", group = "input" },
      },
    },
  },
}
