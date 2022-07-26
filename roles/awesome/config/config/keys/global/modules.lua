local awful = require("awful")
local modkey = require("config.keys.mod").mod_key
local altkey = require("config.keys.mod").alt_key
local apps = require("config.apps")

local modkey = require("config.keys.mod").mod_key

local modules = {
  monitor = require("modules.screen"),
  screenshot = require("modules.screenshot"),
  touchpad = require("modules.touchpad"),
}

local widgets = {
  audio = require("widgets.audio"),
}

awful.keyboard.append_global_keybindings({
  awful.key({ altkey }, "Shift_L", function()
    awesome.emit_signal("widget:keyboard_switch")
  end),

  awful.key({ altkey, "Control" }, "l", function()
    awful.util.spawn(apps.default.lock)
  end),

  -- Screenshot
  awful.key({}, "Print", modules.screenshot.printscreen),
  awful.key({ modkey, "Control" }, "t", modules.touchpad.toggle),
  awful.key({ modkey, "Shift" }, "s", modules.screenshot.snip),

  -- Brightness
  awful.key(
    {},
    "XF86MonBrightnessUp",
    modules.monitor.brightness.increase,
    { description = "+10%", group = "hotkeys" }
  ),
  awful.key(
    {},
    "XF86MonBrightnessDown",
    modules.monitor.brightness.decrease,
    { description = "-10%", group = "hotkeys" }
  ),

  -- Volume control
  awful.key({}, "XF86AudioRaiseVolume", function()
    os.execute("pactl set-sink-volume @DEFAULT_SINK@ +3%")
    widgets.audio.widget.update()
  end, { description = "volume up", group = "hotkeys" }),
  awful.key({}, "XF86AudioLowerVolume", function()
    os.execute("pactl set-sink-volume @DEFAULT_SINK@ -3%")
    widgets.audio.widget.update()
  end, { description = "volume down", group = "hotkeys" }),
  awful.key({}, "XF86AudioMute", function()
    os.execute("pactl set-sink-mute @DEFAULT_SINK@ toggle")
    widgets.audio.widget.update()
  end, { description = "toggle mute", group = "hotkeys" }),

  -- Media control
  awful.key({ modkey }, "p", function()
    awful.spawn("playerctl play-pause")
  end, { description = "play/pause media", group = "media" }),
})
