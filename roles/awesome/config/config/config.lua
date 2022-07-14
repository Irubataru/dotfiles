local kbmap_base_command = "setxkbmap -option ctrl:nocaps "
local homedir = os.getenv("HOME")
local xdg_config_dir = os.getenv("XDG_CONFIG_HOME") or homedir .. "/.config"

return {
  dirs = {
    home = homedir,
    xdg_config = xdg_config_dir,
    awesome_config = xdg_config_dir .. "/awesome",
  },
  keyboard = {
    layouts = {
      {
        command = kbmap_base_command .. "no",
        name = "no",
      },
      {
        command = kbmap_base_command .. "jp2",
        name = "jp",
      },
    },
  },
  screenshot = {
    default_location = homedir .. "/Pictures/Screenshots",
  },
}
