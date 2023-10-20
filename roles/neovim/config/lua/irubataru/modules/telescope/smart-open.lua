-- Neovim plugin for fast file-finding

local M = {
  "danielfalk/smart-open.nvim",
  dependencies = {
    "kkharji/sqlite.lua",
    -- Only required if using match_algorithm fzf
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  cmd = { "Telescope" },
  keys = {"<leader>ff"}

}

M.config = function()
  require("telescope").load_extension("smart_open")
end

M.fzf_options = {
  match_algorithm = "fzf"
}

return M
