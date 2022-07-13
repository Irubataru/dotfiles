local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local apps = require("config.apps")

local homedir = os.getenv("HOME")

return awful.menu({
  items = {
    {
      "programs",
      {
        { "browser", apps.default.web_browser },
        { "games", apps.default.game },
        { "ide", apps.default.development },
      },
    },
    {
      "dirs",
      {
        { "home", apps.default.file_manager .. " " .. homedir },
        { "documents", apps.default.file_manager .. " " .. homedir .. "/Documents" },
        { "downloads", apps.default.file_manager .. " " .. homedir .. "/Downloads" },
      },
    },
    {
      "awesome",
      {
        {
          "hotkeys",
          function()
            return false, hotkeys_popup.show_help
          end,
        },
        { "manual", apps.default.terminal .. " -e man awesome" },
        { "edit config", apps.default.run_terminal(apps.default.text_editor .. " " .. awesome.conffile) },
        { "restart", awesome.restart },
        { "quit", awesome.quit },
      },
    },
    { "open terminal", apps.default.open_terminal },
    {
      "system",
      {
        { "reboot", "systemctl reboot" },
        { "shutdown", "systemctl poweroff" },
        { "suspend", "systemctl suspend" },
        { "hibernate", "systemctl hibernate" },
      },
    },
  },
})
