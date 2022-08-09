-- MODULE AUTO-START
-- Run all the apps listed in configuration/apps.lua as run_on_start_up only once when awesome start

local awful = require("awful")
local naughty = require("naughty")
local apps = require("config.apps")

local run_once = function(cmd, args)
  -- First check if the command exists, if it doesn't exist silently
  awful.spawn.easy_async_with_shell(string.format("which %s", cmd), function(_, which_stderr)
    if not which_stderr or which_stderr == "" then
      awful.spawn.easy_async_with_shell(
        string.format("pgrep -u $USER -x %s > /dev/null || (%s)", cmd, cmd .. " " .. args),
        function(_, stderr)
          -- Debugger
          if not stderr or stderr == "" then
            return
          end
          naughty.notification({
            app_name = "Start-up Applications",
            title = "Oof! Error detected when starting an application!",
            message = stderr:gsub("%\n", ""),
            timeout = 20,
            icon = require("beautiful").awesome_icon,
          })
        end
      )
    end
  end)
end

for _, app in ipairs(apps.run_on_start_up) do
  local first_space = app:find(" ")

  local cmd = app
  local args = ""

  if first_space then
    cmd = app:sub(0, first_space - 1)
    args = app:sub(first_space + 1)
  end

  run_once(cmd, args)
end
