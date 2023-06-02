-- 🦝 Clean and elegant distraction-free writing for NeoVim

local M = {
  "Pocco81/true-zen.nvim",
  cmd = { "TZNarrow", "TZFocus", "TZMinimalist", "TZAtaraxis" },
}

M.config = function()
  require("true-zen").setup({
    modes = {
      ataraxis = {
        padding = {
          top = 3,
          bottom = 3,
        },
        callbacks = {
          open_pre = function()
            vim.cmd("Barbecue hide")
            require("lualine").hide({})
          end,
          close_pos = function()
            vim.cmd("Barbecue show")
            require("lualine").hide({unhide = true})
          end,
        },
      },
    },
    integrations = {
      lualine = true,
      tmux = true,
    },
  })
end

return M
