-- Recall refines the use of Neovim marks by focusing on global marks, streamlining their usage and enhancing their visibility and navigability.

local M = {
  "fnune/recall.nvim",
  keys = {
    {
      "<leader>md",
      function()
        require("recall").clear()
      end,
      desc = "Delete mark",
    },
    {
      "<leader>ml",
      function()
        require("telescope").extensions.recall.recall()
      end,
      desc = "List marks (telescope)",
    },
    {
      "<leader>mm",
      function()
        require("recall").toggle()
      end,
      desc = "Toggle global mark",
    },
    {
      "<leader>mn",
      function()
        require("recall").goto_next()
      end,
      desc = "Go to next mark",
    },
    {
      "<leader>mp",
      function()
        require("recall").goto_prev()
      end,
      desc = "Go to previous mark",
    },
  },
  opts = {
    telescope = {
      autoload = false,
    },
  },
}

return M
