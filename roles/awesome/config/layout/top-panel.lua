local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local widgets = {
  audio = require("widgets.audio"),
  battery = require("widgets.battery"),
  clock = require("widgets.clock"),
  keyboard = require("widgets.keyboard"),
  layouts = require("widgets.layouts"),
  tag_list = require("widgets.tag-list"),
  task_list = require("widgets.task-list"),
}

print(widgets.battery.widget.batteries)

return function(s)
  s.prompt = awful.widget.prompt(s)
  s.task_list = widgets.task_list.setup(s)
  s.tag_list = widgets.tag_list.setup(s)

  local left_widgets = {
    layout = wibox.layout.fixed.horizontal,
    s.tag_list,
    s.prompt,
  }

  local middle_widgets = s.task_list

  local right_widgets = {
    layout = wibox.layout.fixed.horizontal,
    wibox.widget.systray(),
    widgets.keyboard.iconbox,
    widgets.keyboard.widget,
    widgets.audio.iconbox,
    widgets.audio.widget,
  }

  if widgets.battery.has_battery then
    right_widgets = gears.table.join(right_widgets, {
      widgets.battery.iconbox,
      widgets.battery.widget,
    })
  end

  right_widgets = gears.table.join(right_widgets, {
    widgets.clock.iconbox,
    widgets.clock.widget,
    widgets.layouts.setup(s),
  })

  -- Create the wibox
  s.top_panel = awful.wibar({
    position = "top",
    screen = s,
    widget = {
      layout = wibox.layout.align.horizontal,
      left_widgets,
      middle_widgets,
      right_widgets,
    },
  })
end
