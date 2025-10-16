return {
  {
    "nvim-mini/mini-git",
    name = "mini.git",
    cmd = { "Git" },
    opts = {},
    keys = {
      {
        "<leader>go",
        function()
          MiniGit.show_at_cursor()
        end,
        desc = "Open git object at cursor",
      },
    },
  },
}
