-- Obsidian 🤝 Neovim

local M = {
  "epwalsh/obsidian.nvim",
  version = "*", -- use latest release instead of latest commit
  cmd = {},
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/Documents/obsidian-notes/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Documents/obsidian-notes/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    workspaces = {
      name = "personal",
      path = "~/Documents/obsidian-notes",
    },
  },
}

M.config = function()
  require("obsidian").setup({
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/obsidian-notes",
      },
    },
  })
end

return M
