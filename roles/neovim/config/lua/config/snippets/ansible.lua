local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return {}
end

-- NOTE: Only for debugging
-- require("luasnip.session.snippet_collection").clear_snippets("ansible")

local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local r = luasnip.restore_node
local fmta = require("luasnip.extras.fmt").fmta

luasnip.add_snippets("ansible", {
  snippet(
    { trig = "pacman", descr = "Install a package with pacman" },
    fmta(
      [[
        - name: Install <> (pacman)
          community.general.pacman:
            name: <>
            state: present
          become: true
          when: install
      ]],
      {
        i(1, "package"),
        i(2, "package"),
      }
    )
  ),
  snippet(
    { trig = "aur", descr = "Install a package with paru" },
    fmta(
      [[
        - name: Install <> (aur)
          kewlfft.aur.aur:
            name: <>
            state: present
          become: true
          become_user: aur_builder
          when: install
      ]],
      {
        i(1, "package"),
        i(2, "package"),
      }
    )
  ),
  snippet(
    { trig = "cargo", descr = "Install a package with cargo" },
    fmta(
      [[
        - name: Install <> (cargo)
          community.general.cargo:
            name: <>
            state: present
          when: install
      ]],
      {
        i(1, "package"),
        i(2, "package"),
      }
    )
  ),
  snippet(
    { trig = "pipx", descr = "Install a package with pipx" },
    fmta(
      [[
        - name: Install <> (pipx)
          community.general.pipx:
            name: <>
            state: latest
          when: install
      ]],
      {
        i(1, "package"),
        i(2, "package"),
      }
    )
  ),
  snippet(
    { trig = "copy", descr = "Copy file" },
    fmta(
      [[
        - name: Copy <>
          ansible.builtin.copy:
            src: "{{ role_path }}/<>"
            dest: "<>"
      ]],
      {
        i(1, "name"),
        i(2, "file"),
        i(3, "dest"),
      }
    )
  ),
  snippet(
    { trig = "link", descr = "Create a symbolic link" },
    fmta(
      [[
        - name: Link <>
          ansible.builtin.file:
            src: "{{ role_path }}/<>"
            dest: "<>"
            state: link
      ]],
      {
        i(1, "name"),
        i(2, "file"),
        i(3, "dest"),
      }
    )
  ),
  snippet(
    { trig = "directory", descr = "Create a directory" },
    fmta(
      [[
        - name: Create <> directory
          ansible.builtin.file:
            path: "<>"
            state: directory
      ]],
      {
        i(1, "name"),
        i(2, "dir"),
      }
    )
  ),
  snippet(
    { trig = "template", descr = "Create file from template" },
    fmta(
      [[
        - name: Initialise <>
          ansible.builtin.template:
            src: "<>"
            dest: "<>"
      ]],
      {
        i(1, "name"),
        i(2, "template"),
        i(3, "{{ role_path }}/file"),
      }
    )
  ),
  snippet(
    { trig = "git-clone", descr = "Clone a git repo" },
    fmta(
      [[
        - name: Clone <>
          ansible.builtin.git:
            repo: "<>"
            dest: "<>"
            update: no
      ]],
      {
        i(1, "name"),
        i(2, "repo"),
        i(3, "dest"),
      }
    )
  ),
  snippet(
    { trig = "systemd", descr = "Enable a systemd service" },
    fmta(
      [[
        - name: Enable <> service
          ansible.builtin.systemd:
            name: "<>.service"
            enabled: true
            scope: <>
      ]],
      {
        i(1, "name"),
        i(2, "name"),
        i(3, "[user/system]"),
      }
    )
  ),
})
