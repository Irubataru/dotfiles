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

local function split_string(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for part in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, part)
  end
  return t
end

-- Function to simplify paths by showing only the current directory
local function simplify_path(path_str)
  -- If it doesn't look like a path, return as-is
  if not string.match(path_str, "/") then
    return path_str
  end

  -- Extract just the final directory name
  local final_dir = string.match(path_str, "/([^/]+)/?$")
  if final_dir then
    return final_dir
  end

  -- Fallback: if no final directory found, return the original
  return path_str
end

local wezterm = require("wezterm")

-- Icon mappings for common programs
local program_icons = {
  vim = wezterm.nerdfonts.custom_neovim,
  nvim = wezterm.nerdfonts.custom_neovim,
  git = wezterm.nerdfonts.dev_git,
  node = wezterm.nerdfonts.dev_nodejs_small,
  npm = wezterm.nerdfonts.dev_npm,
  python = wezterm.nerdfonts.dev_python,
  lua = wezterm.nerdfonts.dev_lua,
  fish = wezterm.nerdfonts.fa_fish,
  docker = wezterm.nerdfonts.dev_docker,
  ["docker-compose"] = wezterm.nerdfonts.dev_docker .. "  compose",
  lazygit = wezterm.nerdfonts.dev_git .. "  lazygit",
  lg = wezterm.nerdfonts.dev_git .. "  lazygit",
  ncspot = wezterm.nerdfonts.fa_spotify .. "  ncspot",
}

---Function that controls the titles of the wezterm tabs
M.format_tab_title = function()
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
      local components = split_string(title, "%s")

      if #components == 0 then
        return title
      end

      local program = components[1]

      -- Check if the "program" is actually a path (starts with ~ or /)
      if string.match(program, "^[~/]") then
        local folder_icon = wezterm.nerdfonts.md_folder
        return folder_icon .. "  " .. simplify_path(program)
      end

      -- Assume pwd is always the last part of the string, remove it
      if #components > 1 then
        table.remove(components, #components)
      end

      -- If we have an icon for this program, use it
      local icon = program_icons[program]
      if icon then
        if #components > 1 then
          -- Join remaining args (excluding the program name)
          local args = {}
          for i = 2, #components do
            table.insert(args, components[i])
          end
          return icon .. "  " .. table.concat(args, " ")
        else
          return icon
        end
      end

      -- For programs without icons, show program + args with simplified paths
      local result_components = { program }
      for i = 2, #components do
        local component = simplify_path(components[i])
        table.insert(result_components, component)
      end
      return table.concat(result_components, " ")
    end
  )
end

return M
