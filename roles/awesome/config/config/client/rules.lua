local awful = require("awful")
local beautiful = require("beautiful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
  -- All clients will match this rule.
  ruled.client.append_rule({
    id = "global",
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      size_hints_honor = false,
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
    },
  })

  -- Add titlebars to normal clients and dialogs
  ruled.client.append_rule({
    -- @DOC_CSD_TITLEBARS@
    id = "titlebars",
    rule_any = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = false },
  })

  -- Apps that are maximized by default
  ruled.client.append_rule({
    id = "maximized",
    rule_any = { class = {
      "jetbrains-rider",
      "vivaldi-stable",
      "obsidian",
    } },
    properties = {
      maximized = true,
    },
  })
end)
