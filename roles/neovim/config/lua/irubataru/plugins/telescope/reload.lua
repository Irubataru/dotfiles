-- Inspiration from
-- https://ustrajunior.com/posts/reloading-neovim-config-with-telescope/

local M = {}

local status_ok, plenary = pcall(require, "plenary.reload")
if not status_ok then
  return
end

M.reload = function()
  -- Convert a file name to a lua module name
  local function get_module_name(s)
    local module_name = s:gsub("%.lua", ""):gsub("^%.%/", ""):gsub("%/", "."):gsub("%.init", "")
    return module_name
  end

  local opts = {
    prompt_title = "Neovim modules",
    cwd = vim.env.MYVIMRC:gsub("%/init.lua", ""),
    find_command = { "fd", "--type", "f", "\\.lua$" },
    attach_mappings = function(_, map)
      -- Use enter to reload the module
      map("i", "<CR>", function(_)
        local entry = require("telescope.actions.state").get_selected_entry()
        local name = get_module_name(entry.value)
        plenary.reload_module(name)
        print(name .. " reloaded")
      end)
      return true
    end,
  }

  require("telescope.builtin").find_files(opts)
end

return M
