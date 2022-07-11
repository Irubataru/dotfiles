local wk = require("which-key")

wk.setup({
  show_help = false,
  triggers = "auto",
  plugins = { spelling = true },
  key_labels = { ["<leader>"] = "\\" },
})

require("irubataru.keymaps")
