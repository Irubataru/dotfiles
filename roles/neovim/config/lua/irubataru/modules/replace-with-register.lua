-- Replace text with the contents of a register.

local M = {
  "inkarkat/vim-ReplaceWithRegister",
  keys = {
    { "gx", "<Plug>ReplaceWithRegisterOperator", desc = "Replace with register" },
    { "gxx", "<Plug>ReplaceWithRegisterLine", desc = "Replace line with register" },
    -- NOTE: Not sure why this doesn't work
    -- {
    --   mode = "x",
    --   { "gx", "<Plug>ReplaceWithRegisterVisual", desc = "Replace with register" },
    -- },
  },
}

M.config = function()
  local keymap = vim.keymap.set

  -- Disable the default keybinds so I can use other keybinds later
  keymap("n", "<Plug>DisableReplaceWithRegisterOperator", "<Plug>ReplaceWithRegisterOperator", {})
  keymap("n", "<Plug>DisableReplaceWithRegisterLine", "<Plug>ReplaceWithRegisterLine", {})
  keymap("x", "<Plug>DisableReplaceWithRegisterVisual", "<Plug>ReplaceWithRegisterVisual", {})

  local wk = require("which-key")
  wk.add({
    mode = "x",
    { "gx", "<Plug>ReplaceWithRegisterVisual", desc = "Replace with register" },
  })
end

return M
