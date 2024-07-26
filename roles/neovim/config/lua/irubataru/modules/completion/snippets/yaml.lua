local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return {}
end

require("luasnip.session.snippet_collection").clear_snippets("yaml")

local snippet = luasnip.snippet
local t = luasnip.text_node

luasnip.add_snippets("yaml", {
  snippet("ansible-ft", {
    t("# vi"),
    t(": set "),
    t("ft=yaml.ansible :"),
  }),
})
