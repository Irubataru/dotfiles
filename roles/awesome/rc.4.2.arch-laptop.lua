--[[

  Awesome WM Configuration

--]]

-- {{{ Required libraries

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
--local menubar       = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local dpi           = require("beautiful.xresources").apply_dpi

-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({ preset = naughty.config.presets.critical,
                   title = "Oops, there were errors during startup!",
                   text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function (err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, an error happened!",
                     text = tostring(err) })
    in_error = false
  end)
end
-- }}}

-- {{{ Variable definitions

local terminal_cmd = "alacritty"

local modkey       = "Mod4"
local altkey       = "Mod1"
local terminal     = terminal_cmd .. " -e tmux"
local filebrowser  = terminal_cmd .. " -e vifmrun"
local editor       = os.getenv("EDITOR") or "vim"
local scrlocker    = "slock"
local homedir      = os.getenv("HOME")
local confdir      = homedir .. "/.config/awesome"
local wallpaperdir = confdir
local wallpaper    = wallpaperdir .. "/Solar.png"

awful.util.terminal  = terminal
awful.layout.layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  -- awful.layout.suit.fair,
  -- awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  awful.layout.suit.max,
  -- awful.layout.suit.max.fullscreen,
  -- awful.layout.suit.magnifier,
  -- awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.sw,
  -- awful.layout.suit.corner.se,
}

local taglist_buttons = gears.table.join(
  awful.button( { }, 1,
    function(t) t:view_only() end
  ),
  awful.button( { modkey }, 1,
    function(t)
      if client.focus then
          client.focus:move_to_tag(t)
      end
    end
  ),
  awful.button( { }, 3, awful.tag.viewtoggle),
  awful.button( { modkey }, 3,
    function(t)
      if client.focus then
          client.focus:toggle_tag(t)
      end
    end
  ),
  awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
  awful.button( { }, 1,
    function (c)
      if c == client.focus then
        c.minimized = true
      else
        c:emit_signal(
        "request::activate",
        "tasklist",
        {raise = true}
        )
      end
    end
  ),
  awful.button( { }, 3,
    function()
      awful.menu.client_list({ theme = { width = 250 } })
    end
  ),
  awful.button( { }, 4,
    function ()
      awful.client.focus.byidx(1)
    end
  ),
  awful.button( { }, 5,
    function ()
      awful.client.focus.byidx(-1)
    end))

local theme = require("seoul256-awesomewm-theme")
theme.setup{
  taglist_buttons = taglist_buttons,
  tasklist_buttons = tasklist_buttons
}

-- Themes define colours, icons, font and wallpapers.
beautiful.init(theme)
-- beautiful.init(require("seoul256-awesomewm-theme").setup{ taglist_buttons = taglist_buttons, tasklist_buttons = tasklist_buttons })
beautiful.wallpaper = wallpaper

-- }}}

-- {{{ Autostart windowless processes

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
  for _, item in ipairs(cmd_arr) do
    awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", item.cmd, item.cmd .. " " .. item.args))
  end
end

run_once({
  { cmd = "unclutter", args = "-root" },
  { cmd = "xidlehook", args = "--not-when-fullscreen --not-when-audio --timer 900 'systemctl suspend' ''" },
  { cmd = "setxkbmap", args = 'no -option "ctr:nocaps"'},
  { cmd = "xrdb", args =  homedir .. "/.Xresources"}
})

-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
local applications = {
	{"vivaldi", "vivaldi-stable"},
	{"qutebrowser", "qutebrowser"},
  {"discord", "discord" },
	{"steam", "steam"},
  {"rider", "/opt/jetbrains/rider/bin/rider.sh"},
}

local directories = {
	{"home",      filebrowser .. " " .. homedir},
	{"documents", filebrowser .. " " .. homedir .. "/Documents"},
	{"downloads", filebrowser .. " " .. homedir .. "/Downloads"},
}

local myawesomemenu = {
  { "hotkeys",     function() return false, hotkeys_popup.show_help end},
  { "manual",      terminal .. " -e man awesome" },
  { "edit config", string.format("%s -e %s %s", terminal, editor, awesome.conffile) },
  { "restart",     awesome.restart },
  { "quit",        function() awesome.quit() end}
}

local systemcmd = {
	{"reboot",    "systemctl reboot"},
	{"shutdown",  "systemctl poweroff"},
  {"suspend",   "systemctl suspend"},
  {"hibernate", "systemctl hibernate"}
}

awful.util.mymainmenu = awful.menu({
  items = { { "programs",      applications },
            { "dirs",          directories },
            { "awesome",       myawesomemenu, beautiful.awesome_icon },
            { "open terminal", terminal },
            { "system",        systemcmd } }
})

---- Menubar configuration
--menubar.utils.terminal = terminal -- Set the terminal for applications that require it

-- }}}

-- {{{ Custom functionality

-- {{{ Keyboard layout switcher

kbdcfg = {
  cmd = "setxkbmap",
  options = '-option "ctrl:nocaps"',
  layout = {"no","jp"},
  layoutName = {"no","jp2"},
  current = 1,
  switch = function()
    kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
      os.execute( kbdcfg.cmd .. " " .. kbdcfg.layoutName[kbdcfg.current] .. " " .. kbdcfg.options )
    beautiful.widgets.keyboard.update(kbdcfg.layout[kbdcfg.current])
  end
}

beautiful.widgets.keyboard.update(kbdcfg.layout[kbdcfg.current])

-- }}}

-- {{{ Printscreen function

local screenshotloc = homedir .. "/Pictures/Screenshots/"

local printscreen = function()
	local date = os.date("%d-%m-%y_%H.%M")
	local testfile = screenshotloc..date..".png"
	local prtscr_c = 1
	while (awful.util.file_readable(testfile) and (prtscr_c < 100)) do
		testfile = screenshotloc..date.."_"..prtscr_c..".png"
		prtscr_c = prtscr_c + 1
	end
	os.execute( "import -window root "..testfile )
end

local snipping = function()
  os.execute("maim -s | xclip -selection clipboard -t image/png")
end

-- }}}

-- {{{ Touchpad toggle

local toggle_touchpad = function()
  local handle = io.popen("synclient -l | grep TouchpadOff | cut -d '=' -f 2 | tr -d '[:space:]'")
  local result = handle:read("*a")
  handle:close()

  if (result == "0") then
    os.execute("synclient TouchpadOff=1")
  else
    os.execute("synclient TouchpadOff=0")
  end
end

-- }}}

-- {{{ Brightness controls

local brightness = {
  increase = function()
    os.execute("xbacklight -inc 10")
  end,

  decrease = function()
    local handle = assert(io.popen("xbacklight -get", "r"))
    local result = assert(handle:read("*a"))

    handle:close()
    result = string.gsub(
      string.gsub(
        string.gsub(result, '^%s+', ''),
        '%s+$',
        ''
      ),
      '[\n\r]+',
      ' '
    )

    result = assert(tonumber(result))

    if result <= 10 then
      os.execute("xbacklight -set 1")
    else
      os.execute("xbacklight -dec 10")
    end
  end
}

-- }}}

-- }}}

-- {{{ Screen

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
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

---- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)


-- }}}

-- {{{ Mouse bindings

root.buttons(gears.table.join(
  awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))

-- }}}

-- {{{ Key bindings

globalkeys = gears.table.join(

  -- Hotkeys
  awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
            { description="show help", group="awesome"}),

  -- Tag browsing
  awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
            {description = "view previous", group = "tag"}),
  awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
            {description = "view next", group = "tag"}),
  awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
            {description = "go back", group = "tag"}),

  -- Non-empty tag browsing
  awful.key({ altkey }, "Left", function () lain.util.tag_view_nonempty(-1) end,
            {description = "view  previous nonempty", group = "tag"}),
  awful.key({ altkey }, "Right", function () lain.util.tag_view_nonempty(1) end,
            {description = "view  previous nonempty", group = "tag"}),

  -- Default client focus
  awful.key({ modkey,           }, "j",
    function ()
      awful.client.focus.byidx( 1)
    end,
    {description = "focus next by index", group = "client"}
  ),
  awful.key({ modkey,           }, "k",
    function ()
      awful.client.focus.byidx(-1)
    end,
    {description = "focus previous by index", group = "client"}
  ),

  -- By direction client focus
  awful.key({ altkey }, "j",
    function()
      awful.client.focus.global_bydirection("down")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus down", group = "client"}),
  awful.key({ altkey }, "k",
    function()
      awful.client.focus.global_bydirection("up")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus up", group = "client"}),
  awful.key({ altkey }, "h",
    function()
      awful.client.focus.global_bydirection("left")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus left", group = "client"}),
  awful.key({ altkey }, "l",
    function()
      awful.client.focus.global_bydirection("right")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus right", group = "client"}),

  -- Main menu
  awful.key({ modkey,           }, "w", function () awful.util.mymainmenu:show() end,
            {description = "show main menu", group = "awesome"}),

  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
            {description = "swap with next client by index", group = "client"}),
  awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
            {description = "swap with previous client by index", group = "client"}),
  awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
            {description = "focus the next screen", group = "screen"}),
  awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
            {description = "focus the previous screen", group = "screen"}),
  awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
            {description = "jump to urgent client", group = "client"}),
  awful.key({ modkey,           }, "Tab",
    function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "go back", group = "client"}),

  -- Show/Hide Wibox
  awful.key({ modkey }, "b",
            function ()
              for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                  s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
              end
            end,
            {description = "toggle wibox", group = "awesome"}),

  -- Standard program
  awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
            {description = "open a terminal", group = "launcher"}),
  awful.key({ modkey, "Control" }, "r", awesome.restart,
            {description = "reload awesome", group = "awesome"}),
  awful.key({ modkey, "Shift"   }, "q", awesome.quit,
            {description = "quit awesome", group = "awesome"}),

  -- Layout window size modification
  awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
            {description = "increase master width factor", group = "layout"}),
  awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
            {description = "decrease master width factor", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
            {description = "increase the number of master clients", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
            {description = "decrease the number of master clients", group = "layout"}),
  awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
            {description = "increase the number of columns", group = "layout"}),
  awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
            {description = "decrease the number of columns", group = "layout"}),
  awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
            {description = "select next", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
            {description = "select previous", group = "layout"}),

  -- Maximise / minimise
  awful.key({ modkey, "Control" }, "n",
            function ()
              local c = awful.client.restore()
              -- Focus restored client
              if c then
                client.focus = c
                c:raise()
              end
            end,
            {description = "restore minimized", group = "client"}),


  -- Prompt
  awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
            {description = "run prompt", group = "launcher"}),

  awful.key({ modkey }, "x",
            function ()
              awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
              }
            end,
            {description = "lua execute prompt", group = "awesome"}),

  ---- Menubar
  --awful.key({ modkey }, "p", function() menubar.show() end,
  --{description = "show the menubar", group = "launcher"}),

  -- Widget control
  awful.key({ altkey },"Shift_L", function () kbdcfg.switch() end),
  awful.key({ }, "Print", printscreen),
  awful.key({ altkey, "Control" }, "l", function () awful.util.spawn(scrlocker) end),
  awful.key({ modkey, "Control"   }, "t", toggle_touchpad),
  awful.key({ modkey, "Shift" }, "s", snipping),


  -- Brightness
  awful.key({ }, "XF86MonBrightnessUp", brightness.increase,
            {description = "+10%", group = "hotkeys"}),
  awful.key({ }, "XF86MonBrightnessDown", brightness.decrease,
            {description = "-10%", group = "hotkeys"}),

  -- ALSA volume control
  awful.key({ }, "XF86AudioRaiseVolume",
            function ()
              os.execute(string.format("amixer -q set %s 1%%+", "Master"))
              beautiful.widgets.alsa.update()
            end,
            {description = "volume up", group = "hotkeys"}),
  awful.key({ }, "XF86AudioLowerVolume",
            function ()
              os.execute(string.format("amixer -q set %s 1%%-", "Master"))
              beautiful.widgets.alsa.update()
            end,
            {description = "volume down", group = "hotkeys"}),
  awful.key({ }, "XF86AudioMute",
            function ()
              os.execute(string.format("amixer -q set %s toggle", "Master"))
              beautiful.widgets.alsa.update()
            end,
            {description = "toggle mute", group = "hotkeys"})

)

clientkeys = gears.table.join(
  awful.key({ altkey, "Shift"   }, "m",      lain.util.magnify_client,
            {description = "magnify client", group = "client"}),
  awful.key({ modkey,           }, "f",
            function (c)
              c.fullscreen = not c.fullscreen
              c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
  awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
            {description = "close", group = "client"}),
  awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
            {description = "toggle floating", group = "client"}),
  awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
            {description = "move to master", group = "client"}),
  awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
            {description = "move to screen", group = "client"}),
  awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
            {description = "toggle keep on top", group = "client"}),
  awful.key({ modkey,           }, "n",
            function (c)
              -- The client currently has the input focus, so it cannot be
              -- minimized, since minimized clients can't have the focus.
              c.minimized = true
            end ,
            {description = "minimize", group = "client"}),
  awful.key({ modkey,           }, "m",
            function (c)
              c.maximized = not c.maximized
              c:raise()
            end ,
            {description = "(un)maximize", group = "client"}),
  awful.key({ modkey, "Control" }, "m",
            function (c)
              c.maximized_vertical = not c.maximized_vertical
              c:raise()
            end ,
            {description = "(un)maximize vertically", group = "client"}),
  awful.key({ modkey, "Shift"   }, "m",
            function (c)
              c.maximized_horizontal = not c.maximized_horizontal
              c:raise()
            end ,
            {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  { rule = { },
    properties = {
      border_width     = beautiful.border_width,
      border_color     = beautiful.border_normal,
      size_hints_honor = false,
      focus            = awful.client.focus.filter,
      raise            = true,
      keys             = clientkeys,
      buttons          = clientbuttons,
      screen           = awful.screen.preferred,
      placement        = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  },

  -- Titlebars
  { rule_any   = { type = { "dialog", "normal" } },
    properties = { titlebars_enabled = false } },

}
-- }}}

-- {{{ Signals

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
  -- -- Custom
  -- if beautiful.titlebar_fun then
  --   beautiful.titlebar_fun(c)
  --   return
  -- end

  -- Default
  -- buttons for the titlebar
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- }}}
