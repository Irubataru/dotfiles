-- vi: set ft=lua :
local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return {}
end

local snippet = luasnip.snippet
local t = luasnip.text_node
-- local i = luasnip.insert_node
-- local f = luasnip.function_node
-- local c = luasnip.choice_node
-- local d = luasnip.dynamic_node
-- local r = luasnip.restore_node

return {
  snippet("ansible-ft", {
    t("# vi: set ft=yaml.ansible :")
  })
}
