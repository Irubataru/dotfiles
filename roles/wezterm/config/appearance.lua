local wezterm = require("wezterm")

local M = {}

M.apply = function(config)

  config.color_scheme = "Kanagawa (Gogh)"

  config.font = wezterm.font("Maple Mono NF")
  config.font_size = 14

  config.window_padding = {
    left = 4,
    right = 4,
    top = 6,
    bottom = 2,
  }

  config.hide_tab_bar_if_only_one_tab = true
end

return M
