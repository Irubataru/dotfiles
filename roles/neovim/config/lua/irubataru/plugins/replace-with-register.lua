local keymap = vim.keymap.set

local M = {}

M.setup = function ()
  -- Disable the default keybinds so I can use other keybinds later
  keymap("n", "<Plug>DisableReplaceWithRegisterOperator", "<Plug>ReplaceWithRegisterOperator", {})
  keymap("n", "<Plug>DisableReplaceWithRegisterLine", "<Plug>ReplaceWithRegisterLine", {})
  keymap("x", "<Plug>DisableReplaceWithRegisterVisual", "<Plug>ReplaceWithRegisterVisual", {})
end

return M
