-- Tag list wiget: shows the different tags available
local awful = require("awful")
local mod_key = require("config.keys.mod").mod_key

return {
  setup = function(s)
    -- Each screen has its own tag table.
    awful.tag({ "term", "docs", "web", "media", "GUI" }, s, {
      awful.layout.suit.tile.top,
      awful.layout.suit.max,
      awful.layout.suit.floating,
      awful.layout.suit.tile.top,
      awful.layout.suit.floating,
    })

    -- Create a taglist widget
    return awful.widget.taglist({
      screen = s,
      filter = awful.widget.taglist.filter.all,
      buttons = {
        awful.button({}, 1, function(t)
          t:view_only()
        end),
        awful.button({ mod_key }, 1, function(t)
          if client.focus then
            client.focus:move_to_tag(t)
          end
        end),
        awful.button({}, 3, awful.tag.viewtoggle),
        awful.button({ mod_key }, 3, function(t)
          if client.focus then
            client.focus:toggle_tag(t)
          end
        end),
        awful.button({}, 4, function(t)
          awful.tag.viewnext(t.screen)
        end),
        awful.button({}, 5, function(t)
          awful.tag.viewprev(t.screen)
        end),
      },
    })
  end,
}
