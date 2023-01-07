-- Highlight yanked area

local M = {
  "haya14busa/vim-operator-flashy",
  dependencies = { "kana/vim-operator-user" },
}

M.config = function()
  local keymap = vim.keymap.set

  -- Replace yank with flashy-yank that highlights yanked area
  keymap("n", "y", "<Plug>(operator-flashy)", {})
  keymap("n", "Y", "<Plug>(operator-flashy)$", {})

  -- yy seems to be broken
  -- https://github.com/haya14busa/vim-operator-flashy/issues/12
  -- TODO find alternative
  keymap("n", "yy", "yy", {})
end

return M
