local awful = require("awful")
local lain = require("lain")
local modkey = require("config.keys.mod").mod_key
local altkey = require("config.keys.mod").alt_key

awful.keyboard.append_global_keybindings({
  -- Tag browsing
  awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
  awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
  awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

  -- Non-empty tag browsing
  awful.key({ altkey }, "Left", function()
    lain.util.tag_view_nonempty(-1)
  end, { description = "view  previous nonempty", group = "tag" }),
  awful.key({ altkey }, "Right", function()
    lain.util.tag_view_nonempty(1)
  end, { description = "view  previous nonempty", group = "tag" }),
})

-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  awful.keyboard.append_global_keybindings({
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:view_only()
      end
    end, { description = "view tag #" .. i, group = "tag" }),

    -- Toggle tag display.
    awful.key({ modkey, "Control" }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end, { description = "toggle tag #" .. i, group = "tag" }),

    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end, { description = "move focused client to tag #" .. i, group = "tag" }),

    -- Toggle tag on focused client.
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end, { description = "toggle focused client on tag #" .. i, group = "tag" }),
  })
end
