local M = {}

-- run a command synchronously and run execute callback on every line from
-- stdout
-- @param command the command to call
-- @param callback to run on every line
M.sync_spawn_with_line_callback = function(command, callback)
  local call_ok, ifs = pcall(io.popen, command, "r")
  if not call_ok then
    return
  end
  if ifs == nil then
    return
  end

  local output = ifs:read("*a")
  ifs:close()

  for line in output:gmatch("[^\n]+") do
    callback(line)
  end
end

return M
