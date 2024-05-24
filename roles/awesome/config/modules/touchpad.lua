local M = {}

M.touchpad_name = "SYNA3071:00 06CB:82F1 Touchpad"

M.toggle = function()
  local handle = io.popen('xinput list "' .. M.touchpad_name .. '" | grep "This device is disabled"')

  if handle == nil then
    return
  end

  local result = handle:read("*a")
  handle:close()

  if (result == "") then
    os.execute("xinput disable \"" .. M.touchpad_name .. "\"")
  else
    os.execute("xinput enable \"" .. M.touchpad_name .. "\"")
  end
end

return M
