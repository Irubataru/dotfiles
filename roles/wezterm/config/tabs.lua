local M = {}

---This function returns the suggested title for a tab.
---It prefers the title that was set via `tab:set_title()` or `wezterm cli set-tab-title`, but falls
---back to the title of the active pane in that tab.
---@param tab_info any The TabInformation to read the title from
---@return string
local function tab_title(tab_info)
  local title = tab_info.tab_title
  -- If the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane in that tab
  return tab_info.active_pane.title
end

---Function that controls the titles of the wezterm tabs
M.format_tab_title = function()
  local wezterm = require("wezterm")

  wezterm.on(
    "format-tab-title",
    ---Function that controls the titles of the wezterm tabs
    ---@param tab any The TabInformation for the active tab
    ---@param tabs any An array containing TabInformation for each of the tabs in the window
    ---@param panes any An array containing PaneInformation for each of the panes in the active tab
    ---@param config any The effective configuration for the window
    ---@param hover boolean True if the current tab is in the hover state
    ---@param max_width integer The maximum number of cells available to draw this tab when using the retro tab bar style
    ---@return unknown
    function(tab, tabs, panes, config, hover, max_width)
      local title = tab_title(tab)
      return title
    end
  )
end

return M
