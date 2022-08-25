local wk = require("which-key")

wk.setup({
  show_help = false,
  triggers = "auto",
  plugins = {
    spelling = false,
    presets = {
      operators = true,
    },
  },
  key_labels = { ["<leader>"] = "," },
})
