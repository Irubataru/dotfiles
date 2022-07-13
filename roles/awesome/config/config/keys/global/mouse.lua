local awful = require("awful")
local launcher = require("modules.launcher")

awful.mouse.append_global_mousebindings({
  awful.button({}, 3, function()
    launcher:toggle()
  end),
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev),
})
