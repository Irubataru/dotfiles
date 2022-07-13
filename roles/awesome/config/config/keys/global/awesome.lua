local awful = require("awful")
local launcher = require("modules.launcher")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local apps = require("config.apps")

local modkey = require("config.keys.mod").mod_key

awful.keyboard.append_global_keybindings({
  awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
  awful.key({ modkey }, "w", function()
    launcher:show()
  end, { description = "show main menu", group = "awesome" }),

  -- Standard program
  awful.key({ modkey }, "Return", function()
    awful.spawn(apps.default.open_terminal)
  end, { description = "open a terminal", group = "launcher" }),

  awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
  awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

  -- Prompt
  awful.key({ modkey }, "r", function()
    awful.screen.focused().prompt:run()
  end, { description = "run prompt", group = "launcher" }),

  awful.key({ modkey }, "x", function()
    awful.prompt.run({
      prompt = "Run Lua code: ",
      textbox = awful.screen.focused().prompt.widget,
      exe_callback = awful.util.eval,
      history_path = awful.util.get_cache_dir() .. "/history_eval",
    })
  end, { description = "lua execute prompt", group = "awesome" }),
})
