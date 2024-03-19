local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return {}
end

local snippet = luasnip.snippet
local t = luasnip.text_node

return {
  snippet("ansible-ft", {
    t("# vi"),
    t(": set "),
    t("ft=yaml.ansible :"),
  }),
}
