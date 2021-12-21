local wk = require("which-key")
-- local util = require("util")

-- vim.o.timeoutlen = 300

-- local presets = require("which-key.plugins.presets")
-- presets.objects["a("] = nil

wk.setup({
  show_help = false,
  triggers = "auto",
  plugins = { spelling = true },
  key_labels = { ["<leader>"] = "SPC" },
})

require("keymaps")
