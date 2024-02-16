local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.check_for_updates = false

require("appearance").apply(config)
require("keymaps").apply(config)

return config
