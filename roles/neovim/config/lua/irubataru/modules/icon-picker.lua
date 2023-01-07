-- This is a Neovim plugin that helps you pick Nerd Font Icons, Symbols & Emojis

local M = {
  "ziontee113/icon-picker.nvim",
  cmd = { "IconPickerNormal", "IconPickerInsert", "IconPickerYank" },
}

M.dependencies = {
  { "stevearc/dressing.nvim" },
}

M.config = function()
  require("icon-picker").setup({
    disable_legacy_commands = true,
  })
end

return M
