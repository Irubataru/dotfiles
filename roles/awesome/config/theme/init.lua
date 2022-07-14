local dpi = require("beautiful.xresources").apply_dpi
local configdir = require("config.config").dirs.awesome_config
local icons = require("theme.icons")

-- Seoul256 colours
local colors = {
  background = "#3a3a3a",
  foreground = "#d0d0d0",
  black = "#4e4e4e",
  red = "#d68787",
  green = "#5f865f",
  yellow = "#d8af5f",
  blue = "#85add4",
  magenta = "#d7afaf",
  cyan = "#87afaf",
  white = "#d0d0d0",
  lightblack = "#626262",
  lightred = "#d75f87",
  lightgreen = "#87af87",
  lightyellow = "#ffd787",
  lightblue = "#add4fb",
  lightmagenta = "#ffafaf",
  lightcyan = "#87d7d7",
  lightwhite = "#e4e4e4",
  cursorColor = "#d0d0d0",
  cursorColor2 = "#3a3a3a",
  colorBD = "#e4e4e4",
}

return {
  font = "Roboto Mono 9",
  wallpaper = configdir .. "/wallpaper.png",

  -- Colours
  colors = colors,
  fg_normal = colors.foreground,
  fg_focus = colors.lightgreen,
  fg_urgent = colors.background,
  fg_title = colors.blue,
  fg_disabled = colors.background,
  bg_normal = colors.background,
  bg_focus = colors.black,
  bg_urgent = colors.red,
  bg_disabled = colors.lightblack,
  bg_hover = colors.lightblack,

  -- Borders
  border_width = dpi(1),
  border_normal = colors.lightblack,
  border_focus = colors.black,
  border_marked = colors.magenta,

  -- Icons
  awesome_icon = icons.logo.awesome_red,
  tasklist_floating_icon = icons.layouts.floating,
  layout_tile = icons.layouts.tile,
  layout_tileleft = icons.layouts.tileleft,
  layout_tilebottom = icons.layouts.tilebottom,
  layout_tiletop = icons.layouts.tiletop,
  layout_fairv = icons.layouts.fairv,
  layout_fairh = icons.layouts.fairh,
  layout_spiral = icons.layouts.spiral,
  layout_dwindle = icons.layouts.dwindle,
  layout_max = icons.layouts.max,
  layout_fullscreen = icons.layouts.fullscreen,
  layout_magnifier = icons.layouts.magnifier,
  layout_floating = icons.layouts.floating,
  layout_uselesstile = icons.layouts.tile,
  layout_uselesstileleft = icons.layouts.tileleft,
  layout_uselesstilebottom = icons.layouts.tilebottom,
  layout_uselesstiletop = icons.layouts.tiletop,
  layout_uselessfairv = icons.layouts.fairv,
  layout_uselessfairh = icons.layouts.fairh,
}
