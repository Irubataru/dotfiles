local kbmap_base_command = "setxkbmap -option ctrl:nocaps "
local homedir = os.getenv("HOME")

return {
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
  screenshot ={
    default_location = homedir .. "/Pictures/Screenshots"
  }
}
