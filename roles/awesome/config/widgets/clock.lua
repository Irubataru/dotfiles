local wibox = require("wibox")
local icons = require("theme.icons")

local M = {}

M.iconbox = wibox.widget.imagebox(icons.calendar)
M.widget = wibox.widget.textclock()

return M
