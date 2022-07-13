-- Layout widget: shows the current layout and allows switching between them
local awful = require("awful")

return {

  setup = function(s)
    return awful.widget.layoutbox({
      screen = s,
      buttons = {
        awful.button({}, 1, function()
          awful.layout.inc(1)
        end),
        awful.button({}, 3, function()
          awful.layout.inc(-1)
        end),
        awful.button({}, 4, function()
          awful.layout.inc(-1)
        end),
        awful.button({}, 5, function()
          awful.layout.inc(1)
        end),
      },
    })
  end,
}
