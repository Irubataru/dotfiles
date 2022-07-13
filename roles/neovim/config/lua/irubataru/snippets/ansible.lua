local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return {}
end

local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local r = luasnip.restore_node

local function copy(args)
  return args[1]
end

return {
  snippet("pacman", {
    t("- name: Install "),
    i(1, "name"),
    t({" (pacman)", "\t"}),
    t({"pacman:", "\t\t"}),
    t("name: "),
    i(2, "package"),
    t({"", "\t\t"}),
    t({"state: present", "\t"}),
    t("become: true")
  }),
  snippet("link", {
    t("- name: Link "),
    i(1, "name"),
    t({"", "\t"}),
    t({"file:", "\t\t"}),
    t("src: \"{{ role_path}}/"),
    i(2, "file"),
    t({"\"", "\t\t"}),
    t("dest: "),
    i(3, "dest"),
    t({"", "\t\t"}),
    t("state: link")
  }),
  snippet("directory", {
    t("- name: Create "),
    i(1, "name"),
    t({" directory", "\t"}),
    t({"file:", "\t\t"}),
    t("path: "),
    i(2, "dir"),
    t({"", "\t\t"}),
    t("state: directory")
  }),
  snippet("git-clone", {
    t("- name: Clone "),
    i(1, "name"),
    t({"", "\t"}),
    t({"git:", "\t\t"}),
    t("repo: \""),
    i(2, "repo"),
    t({"\"", "\t\t"}),
    t("dest: "),
    i(3, "dest"),
    t({"", "\t\t"}),
    t("update: no"),
  }),
}
