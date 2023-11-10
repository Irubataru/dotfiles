local wezterm = require("wezterm")

local M = {}

M.apply = function(config)
  config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

  -- TODO: Something more similar to which-key here
  config.keys = {

    -- TMUX compatibility commands
    {
      mods = "LEADER",
      key = "c",
      action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },
    {
      mods = "LEADER|CTRL",
      key = "c",
      action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },
    {
      mods = "LEADER|SHIFT",
      key = "x",
      action = wezterm.action.CloseCurrentTab({ confirm = false }),
    },
    {
      mods = "LEADER|CTRL",
      key = "a",
      action = wezterm.action.ActivateLastTab,
    },
    {
      mods = "LEADER",
      key = "n",
      action = wezterm.action.ActivateTabRelative(1),
    },
    {
      mods = "LEADER",
      key = "p",
      action = wezterm.action.ActivateTabRelative(-1),
    },
    {
      mods = "LEADER|SHIFT",
      key = "a",
      action = wezterm.action.PromptInputLine({
        description = "Enter new name for tab",
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      }),
    },
    {
      mods = "LEADER|SHIFT",
      key = "v",
      action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      mods = "LEADER|SHIFT",
      key = "s",
      action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
      mods = "LEADER",
      key = "Tab",
      action = wezterm.action.ActivatePaneDirection("Next"),
    },
    {
      mods = "LEADER",
      key = ":",
      action = wezterm.action.ActivateCommandPalette,
    },
    {
      mods = "LEADER",
      key = "a",
      action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
    },
  }

  -- Activate tab by <C-A> [index]
  for index = 1, 9 do
    table.insert(config.keys, {
      key = tostring(index),
      mods = "LEADER",
      action = wezterm.action.ActivateTab(index - 1),
    })
  end

  -- Mouse bindings
  config.mouse_bindings = {
    -- Clicking the scroll wheel while holding CTRL resets the font size
    {
      event = { Down = { streak = 1, button = "Middle" } },
      mods = "CTRL",
      action = wezterm.action.ResetFontSize,
    },

    -- Scrolling up while holding CTRL increases the font size
    {
      event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = "CTRL",
      action = wezterm.action.IncreaseFontSize,
    },

    -- Scrolling down while holding CTRL decreases the font size
    {
      event = { Down = { streak = 1, button = { WheelDown = 1 } } },
      mods = "CTRL",
      action = wezterm.action.DecreaseFontSize,
    },
  }
end

return M
