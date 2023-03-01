-- A small Neovim plugin for previewing definitions using floating windows.

local M = {
  "rmagatti/goto-preview",
}

M.config = function()
  require("goto-preview").setup({
    post_open_hook = function(buffer, window)
      -- Make q and C-c both close the floating window
      vim.keymap.set("n", "q", function()
        vim.api.nvim_win_close(window, false)
      end, { silent = true, buffer = buffer })
      vim.keymap.set("n", "<C-c>", function()
        vim.api.nvim_win_close(window, false)
      end, { silent = true, buffer = buffer })
    end,
  })
end

return M
