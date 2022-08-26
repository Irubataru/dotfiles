local wk = require("which-key")

wk.setup({
  show_help = false,
  triggers = "auto",
  plugins = {
    spelling = true,
    presets = {
      operators = true,
    },
  },
  key_labels = { ["<leader>"] = "," },
})
