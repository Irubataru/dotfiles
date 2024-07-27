local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.check_for_updates = false

config.enable_wayland = false


require("appearance").apply(config)
require("keymaps").apply(config)

return config
