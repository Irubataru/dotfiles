local lain = require("lain")
local wibox = require("wibox")
local icons = require("theme.icons").widgets.audio
local theme = require("theme")

local M = {}

M.iconbox = wibox.widget.imagebox(icons.full)

M.widget = lain.widget.alsa({
    settings = function()
      if volume_now.status == "off" then
        M.iconbox:set_image(icons.mute)
      else
        if tonumber(volume_now.level) < 30 then
          M.iconbox:set_image(icons.low)
        elseif tonumber(volume_now.level) < 60 then
          M.iconbox:set_image(icons.medium)
        else
          M.iconbox:set_image(icons.full)
        end
      end

      local markup = lain.util.markup
      widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, volume_now.level .. "% "))
    end
})

return M
