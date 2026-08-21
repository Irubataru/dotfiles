return {
  {
    "https://codeberg.org/esensar/nvim-dev-container",
    config = true,
    cmd = {
      "DevcontainerStart",
      "DevcontainerAttach",
      "DevcontainerExec",
      "DevcontainerStop",
      "DevcontainerLogs",
    },
  },
}
