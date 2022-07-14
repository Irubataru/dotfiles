local lain = require("lain")
local wibox = require("wibox")
local icons = require("theme.icons").widgets.battery
local theme = require("theme")
local spawn  = require("awful.spawn")

local function has_battery(name)
    local pspath = "/sys/class/power_supply/"

    local has = false
    spawn.with_line_callback("ls -1 " .. pspath, {
        stdout = function (line)
          if not has and line == name then
            has = true
          end
        end,
    })

    return has
end

local M = {}

M.battery_name = "BAT0"
M.iconbox = wibox.widget.imagebox()

M.widget = lain.widget.bat({
  battery = M.battery_name,
  settings = function()

    local bat_icons = {}
    if bat_now.status == "Charging" then
      bat_icons = icons.charging
    else
      bat_icons = icons.normal
    end

    if bat_now.perc == "N/A" then
      M.iconbox:set_image(bat_icons.zero)
    else
      local perc = tonumber(bat_now.perc)

      if perc < 15 then
        M.iconbox:set_image(bat_icons.zero)
      elseif perc < 35 then
        M.iconbox:set_image(bat_icons.twenty)
      elseif perc < 55 then
        M.iconbox:set_image(bat_icons.fourty)
      elseif perc < 75 then
        M.iconbox:set_image(bat_icons.sixty)
      elseif perc < 95 then
        M.iconbox:set_image(bat_icons.eighty)
      else
        M.iconbox:set_image(bat_icons.full)
      end
    end

    local markup = lain.util.markup
    widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, bat_now.perc .. "% "))
  end
})

M.has_battery = has_battery(M.battery_name)

return M
