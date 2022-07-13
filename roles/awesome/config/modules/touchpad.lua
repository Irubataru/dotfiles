local M = {}

M.toggle = function()
  local handle = io.popen("synclient -l | grep TouchpadOff | cut -d '=' -f 2 | tr -d '[:space:]'")

  if handle == nil then
    return
  end

  local result = handle:read("*a")
  handle:close()

  if (result == "0") then
    os.execute("synclient TouchpadOff=1")
  else
    os.execute("synclient TouchpadOff=0")
  end
end

return M
