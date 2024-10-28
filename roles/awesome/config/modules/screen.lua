local M = {}

M.brightness = {
  increase = function()
    os.execute("brightnessctl set +5%")
  end,

  decrease = function()
    os.execute("brightnessctl set -5%")
    -- local handle = assert(io.popen("xbacklight -get", "r"))
    -- local result = assert(handle:read("*a"))
    --
    -- handle:close()
    -- result = string.gsub(string.gsub(string.gsub(result, "^%s+", ""), "%s+$", ""), "[\n\r]+", " ")
    --
    -- result = assert(tonumber(result))
    --
    -- if result <= 10 then
    --   os.execute("xbacklight -set 1")
    -- else
    --   os.execute("xbacklight -dec 10")
    -- end
  end,
}

return M
