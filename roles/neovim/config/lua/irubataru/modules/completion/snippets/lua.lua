local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return {}
end

local snippet = luasnip.snippet
local i = luasnip.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  snippet({trig="nvim-module", descr="Module file my neovim config"},
    fmta(
      [[
        -- <>

        local M = {
          "<>",
          ft = {},
          keys = {},
        }

        M.config = function()
        end

        return M
      ]],
      {
        i(1, "description"),
        i(2, "package"),
      }
    )
  ),
}
