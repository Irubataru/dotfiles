local awful = require("awful")
local modkey = require("config.keys.mod").mod_key

awful.keyboard.append_global_keybindings({
  -- Redo screen layout
  awful.key({ modkey, "Control" }, "p", function()
    awful.util.spawn("autorandr --change")
  end, { description = "Change the monitor layout", group = "monitor" }),
  awful.key({ modkey, "Control", "Shift" }, "p", function()
    awful.util.spawn("autorandr default")
  end, { description = "Reset monitor layout to default", group = "monitor" }),
})
