local awful = require("awful")
local lain = require("lain")
local modkey = require("config.keys.mod").mod_key
local altkey = require("config.keys.mod").alt_key

awful.keyboard.append_global_keybindings({
  -- Default client focus
  awful.key({ modkey }, "j", function()
    awful.client.focus.byidx(1)
  end, { description = "focus next by index", group = "client" }),
  awful.key({ modkey }, "k", function()
    awful.client.focus.byidx(-1)
  end, { description = "focus previous by index", group = "client" }),

  -- By direction client focus
  awful.key({ altkey }, "j", function()
    awful.client.focus.global_bydirection("down")
    if client.focus then
      client.focus:raise()
    end
  end, { description = "focus down", group = "client" }),
  awful.key({ altkey }, "k", function()
    awful.client.focus.global_bydirection("up")
    if client.focus then
      client.focus:raise()
    end
  end, { description = "focus up", group = "client" }),
  awful.key({ altkey }, "h", function()
    awful.client.focus.global_bydirection("left")
    if client.focus then
      client.focus:raise()
    end
  end, { description = "focus left", group = "client" }),
  awful.key({ altkey }, "l", function()
    awful.client.focus.global_bydirection("right")
    if client.focus then
      client.focus:raise()
    end
  end, { description = "focus right", group = "client" }),
})
