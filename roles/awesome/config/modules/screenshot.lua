local awful = require("awful")
local config = require("config.config")

local cmd = "maim --hidecursor --quiet --format='png'"

local M = {}

M.printscreen = function()
  local save_location = config.screenshot.default_location .. "/"
  local date = os.date("%d-%m-%y_%H.%M")
  local testfile = save_location .. date .. ".png"

  -- If the file exists then try to suffix it
  local prtscr_c = 1
  while awful.util.file_readable(testfile) and (prtscr_c < 100) do
    testfile = save_location .. date .. "_" .. prtscr_c .. ".png"
    prtscr_c = prtscr_c + 1
  end

  -- Finally execute the print screen
  os.execute(cmd .. " \"" .. testfile .. "\"")
end

M.snip = function()
  os.execute(cmd .. " --select --highlight --color=0.85,0.87,0.91,0.2 | xclip -selection clipboard -t image/png")
end

return M
