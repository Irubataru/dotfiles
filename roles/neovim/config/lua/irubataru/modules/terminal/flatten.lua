-- Open files and command output from wezterm, kitty, and neovim terminals in your current neovim instance

local M = {
  "willothy/flatten.nvim",
  opts = {
    window = {
      open = "alternate",
    },
    one_per = {
      wezterm = true,
    },
  },
  -- Ensure that it runs first to minimize delay when opening file from terminal
  lazy = false,
  priority = 1001,
}

return M
