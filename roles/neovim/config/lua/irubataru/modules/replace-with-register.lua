-- Replace text with the contents of a register.

local M = {
  "inkarkat/vim-ReplaceWithRegister",
  keys = { "gx", "gxx" }
}

M.config = function()
  local keymap = vim.keymap.set

  -- Disable the default keybinds so I can use other keybinds later
  keymap("n", "<Plug>DisableReplaceWithRegisterOperator", "<Plug>ReplaceWithRegisterOperator", {})
  keymap("n", "<Plug>DisableReplaceWithRegisterLine", "<Plug>ReplaceWithRegisterLine", {})
  keymap("x", "<Plug>DisableReplaceWithRegisterVisual", "<Plug>ReplaceWithRegisterVisual", {})
end

return M
