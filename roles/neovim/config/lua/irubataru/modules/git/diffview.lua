-- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.

local M = {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewFileHistory",
  }
}

M.dependencies = {
  { "nvim-lua/plenary.nvim" },
}

M.config = function()
  require("diffview").setup({
    file_panel = {
      listing_style = "tree",
      tree_options = {
        flatten_dirs = true,
        folder_statuses = "only_folded",
      },
      win_config = {
        position = "top",
        height = 16,
      },
    },
  })
end

return M
