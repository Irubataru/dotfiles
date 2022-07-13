-- Keyboard widget: shows current keybaord layout and handles switching
local wibox = require("wibox")
local icons = require("theme.icons")
local theme = require("theme")
local markup = require("lain").util.markup
local layouts = require("config").config.keyboard.layouts

local M = {}

local layout_id = 1
M.iconbox = wibox.widget.imagebox(icons.widgets.keyboard)
M.widget = wibox.widget.textbox(" " .. layouts[layout_id].name .. " " )

awesome.connect_signal("widget:keyboard_switch", function()
  layout_id = layout_id % #(layouts) + 1
  local layout = layouts[layout_id]
  os.execute(layout.command)
  M.widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, " " .. layout.name .. " "))
end)

return M
