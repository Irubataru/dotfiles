vim.g.mapleader = ","

_G.irubataru = {}

require("irubataru.core.autocommands")
require("irubataru.core.modules")
require("irubataru.core.colours")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("irubataru.core.keymaps")
  end,
})
