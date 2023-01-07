-- A file explorer tree for neovim written in lua

local M = {
  "kyazdani42/nvim-tree.lua",
  cmd = {
    "NvimTreeOpen",
    "NvimTreeToggle",
    "NvimTreeFindFileToggle",
  },
}

M.config = function()
  require("nvim-tree").setup({
    view = {
      preserve_window_proportions = true,
    },
    update_focused_file = { enable = true },
    actions = {
      open_file = {
        window_picker = {
          exclude = {
            filetype = {
              "packer",
              "qf",
            },
            buftype = {
              "terminal",
              "help",
            },
          },
        },
      },
    },
  }
)
end

return M
