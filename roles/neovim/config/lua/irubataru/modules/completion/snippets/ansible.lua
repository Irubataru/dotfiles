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
local fmt = require("luasnip.extras.fmt").fmt

return {
  snippet({trig="pacman", descr="Install a package with pacman"},
    fmt(
      [[
        - name: Install {} (pacman)
          community.general.pacman:
            name: {}
            state: present
          become: true
      ]],
      {
        i(1, "package"),
        i(2, "package"),
      }
    )
  ),
  snippet({trig="aur", descr="Install a package with paru"},
    fmt(
      [[
        - name: Install {} (aur)
          kewlfft.aur.aur:
            name: {}
            state: present
          become: true
          become_user: aur_builder
      ]],
      {
        i(1, "package"),
        i(2, "package"),
      }
    )
  ),
  snippet({trig="copy", descr="Copy file"},
    fmt(
      [[
        - name: Copy {}
          ansible.builtin.copy:
            src: "{{ role_path}}/{}"
            dest: "{}"
      ]],
      {
        i(1, "name"),
        i(2, "file"),
        i(3, "dest"),
      }
    )
  ),
  snippet({trig="link", descr="Create a symbolic link"},
    fmt(
      [[
        - name: Link {}
          ansible.builtin.file:
            src: "{{ role_path}}/{}"
            dest: "{}"
            state: link
      ]],
      {
        i(1, "name"),
        i(2, "file"),
        i(3, "dest"),
      }
    )
  ),
  snippet({trig="directory", descr="Create a directory"},
    fmt(
      [[
        - name: Create {} directory
          ansible.builtin.file:
            path: "{}"
            state: directory
      ]],
      {
        i(1, "name"),
        i(2, "dir"),
      }
    )
  ),
  snippet({trig="git-clone", descr="Clone a git repo"},
    fmt(
      [[
        - name: Clone {}
          ansible.builtin.git:
            repo: "{}"
            dest: "{}"
            update: no
      ]],
      {
        i(1, "name"),
        i(2, "repo"),
        i(3, "dest"),
      }
    )
  ),
  snippet({trig="systemd", descr="Enable a systemd service"},
    fmt(
      [[
        - name: Enable {} service
          ansible.builtin.systemd:
            name: "{}.service"
            enabled: true
            scope: {}
      ]],
      {
        i(1, "name"),
        i(2, "name"),
        i(3, "[user/system]")
      }
    )
  ),
}
