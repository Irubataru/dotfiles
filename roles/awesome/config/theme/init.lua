--[[

  seoul256 Awesome WM theme
  github.com/Irubataru

--]]

local dpi   = require("beautiful.xresources").apply_dpi

local os      = os
local configdir = os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config"

local theme   = {}
theme.confdir = configdir .. "/awesome/theme"
theme.icondir = theme.confdir .. "/icons"
theme.font    = "Roboto Mono 9"

theme.config = {
  taglist_buttons = nil,
  tasklist_buttons = nil
}

function theme.setup(config)
  if type(config) == 'table' then
    for k, v in pairs(config) do
      if type(k) == 'number' then
        table.insert(theme.config, v)
      else
        theme.config[k] = v
      end
    end
  else
    table.insert(theme.config, arg)
  end
end

theme.wallpaper = configdir .. "/awesome/brush_colors.png"

-- {{{ Colours

local colors = {}

colors.xresources = {
  "#3a3a3a", -- background
  "#d0d0d0", -- foreground
  "#4e4e4e", -- color0
  "#d68787", -- color1
  "#5f865f", -- color2
  "#d8af5f", -- color3
  "#85add4", -- color4
  "#d7afaf", -- color5
  "#87afaf", -- color6
  "#d0d0d0", -- color7
  "#626262", -- color8
  "#d75f87", -- color9
  "#87af87", -- color10
  "#ffd787", -- color11
  "#add4fb", -- color12
  "#ffafaf", -- color13
  "#87d7d7", -- color14
  "#e4e4e4", -- color15
  "#d0d0d0", -- cursorColor
  "#3a3a3a", -- cursorColor2
  "#e4e4e4"  -- colorBD
}

colors.background   = colors.xresources[1]
colors.foreground   = colors.xresources[2]
colors.black        = colors.xresources[3]
colors.red          = colors.xresources[4]
colors.green        = colors.xresources[5]
colors.yellow       = colors.xresources[6]
colors.blue         = colors.xresources[7]
colors.magenta      = colors.xresources[8]
colors.cyan         = colors.xresources[9]
colors.white        = colors.xresources[10]
colors.lightblack   = colors.xresources[11]
colors.lightred     = colors.xresources[12]
colors.lightgreen   = colors.xresources[13]
colors.lightyellow  = colors.xresources[14]
colors.lightblue    = colors.xresources[15]
colors.lightmagenta = colors.xresources[16]
colors.lightcyan    = colors.xresources[17]
colors.lightwhite   = colors.xresources[18]

theme.fg_normal     = colors.foreground
theme.fg_focus      = colors.lightgreen
theme.fg_urgent     = colors.background
theme.fg_title      = colors.blue
theme.fg_disabled   = colors.background
theme.bg_normal     = colors.background
theme.bg_focus      = colors.black
theme.bg_urgent     = colors.red
theme.bg_disabled   = colors.lightblack
theme.bg_hover      = colors.lightblack
theme.border_width  = dpi(1)
theme.border_normal = colors.lightblack
theme.border_focus  = colors.black
theme.border_marked = colors.magenta

-- }}}

-- {{{ Icons

-- {{{ F-f-float

theme.tasklist_floating_icon = theme.icondir .. "/layouts-huge/floating-greyish.png"

-- }}}

-- {{{ Layout icons

theme.layoutsicondir = theme.icondir .. "/layouts"

theme.layout_tile           = theme.icondir .. "/layouts/tile.png"
theme.layout_tileleft       = theme.icondir .. "/layouts/tileleft.png"
theme.layout_tilebottom     = theme.icondir .. "/layouts/tilebottom.png"
theme.layout_tiletop        = theme.icondir .. "/layouts/tiletop.png"
theme.layout_fairv          = theme.icondir .. "/layouts/fairv.png"
theme.layout_fairh          = theme.icondir .. "/layouts/fairh.png"
theme.layout_spiral         = theme.icondir .. "/layouts/spiral.png"
theme.layout_dwindle        = theme.icondir .. "/layouts/dwindle.png"
theme.layout_max            = theme.icondir .. "/layouts/max.png"
theme.layout_fullscreen     = theme.icondir .. "/layouts/fullscreen.png"
theme.layout_magnifier      = theme.icondir .. "/layouts/magnifier.png"
theme.layout_floating       = theme.icondir .. "/layouts/floating.png"

theme.layout_uselesstile        = theme.icondir .. "/layouts/tile.png"
theme.layout_uselesstileleft    = theme.icondir .. "/layouts/tileleft.png"
theme.layout_uselesstilebottom  = theme.icondir .. "/layouts/tilebottom.png"
theme.layout_uselesstiletop     = theme.icondir .. "/layouts/tiletop.png"
theme.layout_uselessfairv       = theme.icondir .. "/layouts/fairv.png"
theme.layout_uselessfairh       = theme.icondir .. "/layouts/fairh.png"
-- theme.layout_centerwork         = theme.icondir .. "/layouts/centerwork.png"
-- theme.layout_cascade            = theme.icondir .. "/layouts/cascade.png"
-- theme.layout_cascadebrowse      = theme.icondir .. "/layouts/cascadebrowse.png"

-- }}}

-- {{{ Titlebar icons

-- theme.titlebar_close_button_focus               = theme.icondir .. "/titlebar/close_focus-darkbrown.png"
-- theme.titlebar_ontop_button_focus_active        = theme.icondir .. "/titlebar/ontop_focus_active-darkbrown.png"
-- theme.titlebar_ontop_button_focus_inactive      = theme.icondir .. "/titlebar/ontop_focus_inactive-darkbrown.png"
-- theme.titlebar_sticky_button_focus_active       = theme.icondir .. "/titlebar/sticky_focus_active-darkbrown.png"
-- theme.titlebar_sticky_button_focus_inactive     = theme.icondir .. "/titlebar/sticky_focus_inactive-darkbrown.png"
-- theme.titlebar_floating_button_focus_active     = theme.icondir .. "/titlebar/floating_focus_active-darkbrown.png"
-- theme.titlebar_floating_button_focus_inactive   = theme.icondir .. "/titlebar/floating_focus_inactive-darkbrown.png"
-- theme.titlebar_maximized_button_focus_active    = theme.icondir .. "/titlebar/maximized_focus_active-darkbrown.png"
-- theme.titlebar_maximized_button_focus_inactive  = theme.icondir .. "/titlebar/maximized_focus_inactive-darkbrown.png"

-- theme.titlebar_close_button_normal              = theme.icondir .. "/titlebar/close_normal-red.png"
-- theme.titlebar_ontop_button_normal_active       = theme.icondir .. "/titlebar/ontop_normal_active-red.png"
-- theme.titlebar_ontop_button_normal_inactive     = theme.icondir .. "/titlebar/ontop_normal_inactive-green.png"
-- theme.titlebar_sticky_button_normal_active      = theme.icondir .. "/titlebar/sticky_normal_active-green.png"
-- theme.titlebar_sticky_button_normal_inactive    = theme.icondir .. "/titlebar/sticky_normal_inactive-blue.png"
-- theme.titlebar_floating_button_normal_active    = theme.icondir .. "/titlebar/floating_normal_active-red.png"
-- theme.titlebar_floating_button_normal_inactive  = theme.icondir .. "/titlebar/floating_normal_inactive-blue.png"
-- theme.titlebar_maximized_button_normal_active   = theme.icondir .. "/titlebar/maximized_normal_active-red.png"
-- theme.titlebar_maximized_button_normal_inactive = theme.icondir .. "/titlebar/maximized_normal_inactive-green.png"

-- }}}

theme.awesome_icon = theme.icondir .. "/logo/awesome-red.png"

-- }}}

return theme
