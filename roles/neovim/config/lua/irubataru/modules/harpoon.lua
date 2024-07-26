-- Getting you where you want with the fewest keystrokes

local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  keys = {
    {
      "<C-p>",
      function()
        require("harpoon"):list():prev({ ui_nav_wrap = true })
      end,
      desc = "Next harpoon",
    },
    {
      "<C-n>",
      function()
        require("harpoon"):list():next({ ui_nav_wrap = true })
      end,
      desc = "Next harpoon",
    },
    {
      "<A-1>",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon 1",
    },
    {
      "<A-2>",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon 2",
    },
    {
      "<A-3>",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon 3",
    },
    {
      "<A-4>",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon 4",
    },

    { "<leader>h", group = "harpoon" },
    {
      "<leader>ha",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Add harpoon mark",
    },
    {
      "<leader>hv",
      function()
        require("harpoon")
        require("telescope").extensions.harpoon.marks()
      end,
      desc = "List harpoon marks",
    },
  },
}

M.config = function()
  require("harpoon").setup()
  require("telescope").load_extension("harpoon")
end

return M
