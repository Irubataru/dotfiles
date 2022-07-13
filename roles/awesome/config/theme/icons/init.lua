local configdir = os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config"
local path = configdir .. "/awesome/theme/icons"

return {
  layouts = {
    dwindle = path .. "/layouts/dwindle.png",
    fairh = path .. "/layouts/fairh.png",
    fairv = path .. "/layouts/fairv.png",
    floating = path .. "/layouts/floating.png",
    fullscreen = path .. "/layouts/fullscreen.png",
    magnifier = path .. "/layouts/magnifier.png",
    max = path .. "/layouts/max.png",
    spiral = path .. "/layouts/spiral.png",
    tile = path .. "/layouts/tile.png",
    tilebottom = path .. "/layouts/tilebottom.png",
    tileleft = path .. "/layouts/tileleft.png",
    tiletop = path .. "/layouts/tiletop.png",
  },
  logo = {
    awesome_green = path .. "/logo/awesome-green.png",
    awesome_blue = path .. "/logo/awesome-blue.png",
    awesome_red = path .. "/logo/awesome-red.png",
  },
  widgets = {
    audio = {
      low = path .. "/widgets/alsa/volume-low.png",
      medium = path .. "/widgets/alsa/volume-medium.png",
      full = path .. "/widgets/alsa/volume-high.png",
      mute = path .. "/widgets/alsa/volume-off.png",
    },
    battery = {
      normal = {
        zero = path .. "/widgets/bat/battery-alert.png",
        twenty = path .. "/widgets/bat/battery-20.png",
        fourty = path .. "/widgets/bat/battery-40.png",
        sixty = path .. "/widgets/bat/battery-60.png",
        eighty = path .. "/widgets/bat/battery-80.png",
        full = path .. "/widgets/bat/battery.png",
      },
      charging = {
        zero = path .. "/widgets/bat/battery-charging-0.png",
        twenty = path .. "/widgets/bat/battery-charging-20.png",
        fourty = path .. "/widgets/bat/battery-charging-40.png",
        sixty = path .. "/widgets/bat/battery-charging-60.png",
        eighty = path .. "/widgets/bat/battery-charging-80.png",
        full = path .. "/widgets/bat/battery-charging-100.png",
      }
    },
    calendar = path .. "/widgets/clock/calendar.png",
    keyboard = path .. "/widgets/keyboard/keyboard.png",
  },
}
