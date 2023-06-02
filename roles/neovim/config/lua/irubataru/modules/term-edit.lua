-- Allowing you to edit your command in the terminal just like any other buffers.

local M = {
  "chomosuke/term-edit.nvim",
  ft = "toggleterm",
}

M.config = function()
  require("term-edit").setup({
    prompt_end = "❯ ",
  })
end

return M
