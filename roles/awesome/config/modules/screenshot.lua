local awful = require("awful")
local config = require("config.config")

local M = {}

M.printscreen = function()
  local date = os.date("%d-%m-%y_%H.%M")
  local testfile = config.screenshot.default_location .. date .. ".png"
  local prtscr_c = 1
  while awful.util.file_readable(testfile) and (prtscr_c < 100) do
    testfile = config.screenshot.default_location .. date .. "_" .. prtscr_c .. ".png"
    prtscr_c = prtscr_c + 1
  end
  os.execute("import -window root " .. testfile)
end

M.snip = function()
  os.execute("maim -s | xclip -selection clipboard -t image/png")
end

return M
