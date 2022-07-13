local beautiful = require("beautiful")
local top_panel = require("layout.top-panel")

screen.connect_signal("request::desktop_decoration", function(s)
  s.top_panel = top_panel(s)
end)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function (s)
  local only_one = #s.tiled_clients == 1
  for _, c in pairs(s.clients) do
    if only_one and not c.floating or c.maximized then
      c.border_width = 0
    else
      c.border_width = beautiful.border_width
    end
  end
end)
