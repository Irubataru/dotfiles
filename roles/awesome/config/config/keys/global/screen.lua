local awful = require("awful")
local modkey = require("config.keys.mod").mod_key

awful.keyboard.append_global_keybindings({
  -- Redo screen layout
  awful.key({ modkey, "Control" }, "p", function()
    awful.util.spawn("xlayoutdisplay")
  end, { description = "focus next by index", group = "client" }),
})
