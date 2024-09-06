local beautiful = require("beautiful")
local awful = require("awful")

awful.util.shell = "sh"

require("modules.startup-errors")

-- Theme
beautiful.init(require("theme"))

-- Layout
require("layout")

-- Configurations
require("config.client")
require("config.tags")
require("config.keys.global")
require("config.notifications")

-- Modules
require("modules.auto-start")
require("modules.wallpaper")
